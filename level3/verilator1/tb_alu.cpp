#include <stdlib.h>
#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Valu.h"
#include "Valu___024unit.h"
#include <cstdlib>
#include <deque>

#define MAX_SIM_TIME 300
vluint64_t sim_time = 0;
vluint64_t posedge_cnt = 0;
#define VERIF_START_TIME 7

class AluInTx {
	public:
		uint32_t a;
		uint32_t b;
		enum Operation {
			add = Valu___024unit::operation_t::add,
			sub = Valu___024unit::operation_t::sub,
			nop = Valu___024unit::operation_t::nop
		} op;
};

AluInTx* rndAluInTx(){
	if(rand()%5 == 0){
		AluInTx *tx = new AluInTx();
		tx->op = AluInTx::Operation(rand()%3);
		tx->a = rand()%11 + 10;
		tx->b = rand()%6;
		return tx;
	} else {
		return NULL;
	}
}

class AluInDrv {
	private:
		Valu *dut;
	public:
		AluInDrv(Valu *dut){
			this->dut = dut;
		}
		void drive(AluInTx *tx){
			dut->in_valid = 0;
			if(tx!=NULL){
				if(tx->op != AluInTx::nop){
					dut->in_valid = 1;
					dut->op_in = tx->op;
					dut->a_in = tx->a;
					dut->b_in = tx->b;
				}
				delete tx;
			}
		}
};

class AluOutTx {
	public:
		uint32_t out;
};

class AluScb {
	private:
		std::deque<AluInTx*> in_q;

	public:
		//input interface monitor port
		void writeIn(AluInTx* tx){
			//push the received item into the deque
			in_q.push_back(tx);
		}

		//Output interface monitor port
		void writeOut(AluOutTx* tx){
			//we should never get any data from the output interface
			//before any input gets driven to the input interface
			if(in_q.empty()){
				std::cout<<"Fatal Error in AluScb: empty AluInTx queue"<<std::endl;
				exit(1);
			}

			//Grab the item from the front of the queue
			AluInTx* in;
			in = in_q.front();
			in_q.pop_front();
			switch(in->op){
				case AluInTx::nop :
					std::cout << "Fatal Error in AluScb: received NOP on input"<<std::endl;
					exit(1);
					break;
				case AluInTx::add :
					if(in->a + in->b != tx->out){
						std::cout<<std::endl;
						std::cout<<"AluScb: add mismatch" << std::endl;
						std::cout<< " Expected: "<<in->a + in->b
							<< " Actual: " <<tx->out<<std::endl;
						std::cout<< "Simtime: "<<sim_time<<std::endl;
					}
					break;
				case AluInTx::sub :
					if(in->a - in->b != tx->out){
						std::cout<<std::endl;
						std::cout<<"AluScb: sub mismatch"<<std::endl;
						std::cout<< " Expected: " << in->a - in->b
							<< " Actual: " << std::endl;
						std::cout<< "Simtime: "<< sim_time << std::endl;
					}
					break;
			}
			delete in;
			delete tx;
		}
};

class AluInMon {
        private:
                Valu *dut;
                AluScb *scb;
        public:
                AluInMon(Valu *dut, AluScb *scb){
                        this->dut = dut;
                        this->scb = scb;
                }
                void monitor(){
                        if(dut->in_valid == 1) {
                                //if there is a valid input
                                //create a tx item and populate
                                //it with data observed at the pins
                                AluInTx *tx = new AluInTx();
                                tx->op = AluInTx::Operation(dut->op_in);
                                tx->a = dut->a_in;
                                tx->b = dut->b_in;
                                //then pass it to the scoreboard
                                scb->writeIn(tx);
                        }
                }

};

class AluOutMon{
        private:
                Valu *dut;
                AluScb *scb;
        public:
                AluOutMon(Valu *dut, AluScb *scb){
                        this->dut = dut;
                        this->scb = scb;
                }

                void monitor(){
                        if(dut->out_valid == 1){
                                //if there is a valid output create a new tx
                                //and populate it with the output
                                AluOutTx *tx = new AluOutTx();
                                tx->out = dut->out;
                                //then pass it to the scb
                                scb->writeOut(tx);
                        }
                }
};

void dut_reset (Valu *dut, vluint64_t & sim_time){
        dut->rst = 0;
        if(sim_time>=3 && sim_time <6){
                  dut->rst =1;
                  dut->a_in = 0;
                  dut->b_in = 0;
                  dut->op_in = 0;
                  dut->in_valid = 0;
        }
}

int main(int argc, char** argv, char** env) {
	srand(time(NULL));
	Verilated::commandArgs(argc, argv);
	Valu *dut = new Valu;

	Verilated::traceEverOn(true);
	VerilatedVcdC *m_trace = new VerilatedVcdC;
	dut->trace(m_trace, 5);
	m_trace->open("waveform.vcd");
	AluInTx *tx;
	//driver, scoreboard, input, output monitors
	AluInDrv *drv = new AluInDrv(dut);
	AluScb *scb = new AluScb();
	AluInMon *inMon = new AluInMon(dut, scb);
	AluOutMon *outMon = new AluOutMon(dut, scb);

	while(sim_time < MAX_SIM_TIME){
		dut_reset(dut, sim_time);
		
		dut->clk ^= 1;
		dut->eval();
		
		if(dut->clk==1){
			if(sim_time >= VERIF_START_TIME) {
				//generate a randomized item of AluInTx
				tx = rndAluInTx();

				//pass the tx to the input driver
				//which drives the interface
				drv->drive(tx);

				//monitor inputs
				inMon->monitor();
				//monitor outputs
				outMon->monitor();
			}
		}
		//end of posedge processing

		m_trace->dump(sim_time);
		sim_time++;
	}
	
	m_trace->close();
	delete dut;
	delete outMon;
	delete inMon;
	delete scb;
	delete drv;
	exit(EXIT_SUCCESS);
}

/*
 * main.c
 *
 *  Created on: 28. okt. 2019
 *      Author: nbnb2
 */

#include <stdio.h>
#include <stdlib.h>

#include "xparameters.h"
#include "IIR_filter.h"
#include "xil_io.h"
#include "xil_printf.h"
#include "xuartps_hw.h"

// COEFF ARE AS FOLLOW: b0, b1, b2, a1, a2
u32 FILTER1[] = { 0x40000000, 0x00, 0x00, 0x00, 0x00 };	//No filter
u32 FILTER2[] = { 0x10C39D, 0x218739, 0x10C39D, 0x85EB7E69, 0x3A579075 }; 	//LOW PASS 500Hz
u32 FILTER3[] = { 0x40296D, 0x8052DA, 0x40296D, 0x8BD173A2, 0x352F3211 };	//LOW PASS 1000Hz
u32 FILTER4[] = { 0xC19E300, 0xC19E300, 0x00, 0xD86C2268, 0x00 };			//LOW PASS 3500Hz

void printvalues() {
	//Get new data from AXI
	printf("Filter has following settings:\n");
	printf("Coefficient 1: ");
	printf("%x\n", Xil_In32(XPAR_IIR_FILTER_0_S00_AXI_BASEADDR + IIR_FILTER_S00_AXI_SLV_REG0_OFFSET));
	printf("Coefficient 2: ");
	printf("%x\n", Xil_In32(XPAR_IIR_FILTER_0_S00_AXI_BASEADDR + IIR_FILTER_S00_AXI_SLV_REG1_OFFSET));
	printf("Coefficient 3: ");
	printf("%x\n", Xil_In32(XPAR_IIR_FILTER_0_S00_AXI_BASEADDR + IIR_FILTER_S00_AXI_SLV_REG2_OFFSET));
	printf("Coefficient 4: ");
	printf("%x\n", Xil_In32(XPAR_IIR_FILTER_0_S00_AXI_BASEADDR + IIR_FILTER_S00_AXI_SLV_REG3_OFFSET));
	printf("Coefficient 5: ");
	printf("%x\n", Xil_In32(XPAR_IIR_FILTER_0_S00_AXI_BASEADDR + IIR_FILTER_S00_AXI_SLV_REG4_OFFSET));
	printf("Please choose which filter to use: \n\n");
}

int main() {
	int n = 0;
		printf("Welcome to IIR filter\n");
		printf("Filter 1 = No Filter\n");
		printf("Filter 2 = 500Hz Low Pass\n");
		printf("Filter 3 = 1kHz Low Pass\n");
		printf("Filter 4 = 3.5kHz High Pass\n");
		printf("Please choose which filter to use: \n");
		while (1) {

		n = XUartPs_RecvByte(STDIN_BASEADDRESS) - 0x30;
		//printf("%d\n", n);

		switch (n) {
		case 1:
			//Write data via AXI
			Xil_Out32(0x43C00000, FILTER1[0]);
			Xil_Out32(0x43C00004, FILTER1[1]);
			Xil_Out32(0x43C00008, FILTER1[2]);
			Xil_Out32(0x43C0000C, FILTER1[3]);
			Xil_Out32(0x43C00010, FILTER1[4]);
			printvalues();
			break;
		case 2:
			//Write data via AXI
			Xil_Out32(0x43C00000, FILTER2[0]);
			Xil_Out32(0x43C00004, FILTER2[1]);
			Xil_Out32(0x43C00008, FILTER2[2]);
			Xil_Out32(0x43C0000C, FILTER2[3]);
			Xil_Out32(0x43C00010, FILTER2[4]);
			printvalues();
			break;
		case 3:
			//Write data via AXI
			Xil_Out32(0x43C00000, FILTER3[0]);
			Xil_Out32(0x43C00004, FILTER3[1]);
			Xil_Out32(0x43C00008, FILTER3[2]);
			Xil_Out32(0x43C0000C, FILTER3[3]);
			Xil_Out32(0x43C00010, FILTER3[4]);
			printvalues();
			break;
		case 4:
			//Write data via AXI
			Xil_Out32(0x43C00000, FILTER4[0]);
			Xil_Out32(0x43C00004, FILTER4[1]);
			Xil_Out32(0x43C00008, FILTER4[2]);
			Xil_Out32(0x43C0000C, FILTER4[3]);
			Xil_Out32(0x43C00010, FILTER4[4]);
			printvalues();
			break;
		default:
			printf("Please enter a number between 1 and 4: \n");
			break;
		}
	}
	return 0;
}


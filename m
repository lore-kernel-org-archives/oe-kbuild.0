Content-Type: multipart/mixed; boundary="===============1191239544965902888=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [habanaai:habanalabs-next 32/37] drivers/misc/habanalabs/gaudi/gaudi.c:5907 gaudi_print_ecc_info() warn: ignoring unreachable code.
Date: Mon, 18 May 2020 15:44:15 +0300
Message-ID: <20200518124415.GJ2078@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1191239544965902888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/HabanaAI/linux.git habanalabs-next
head:   65c6a55c2a047806fa0fc365bc32bbe6b2aebd7b
commit: 389aaa2864706e8aa53576642d95761c90861171 [32/37] habanalabs: add ga=
udi asic-dependent code

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/misc/habanalabs/gaudi/gaudi.c:5907 gaudi_print_ecc_info() warn: ign=
oring unreachable code.

# https://github.com/HabanaAI/linux/commit/389aaa2864706e8aa53576642d95761c=
90861171
git remote add habanaai https://github.com/HabanaAI/linux.git
git remote update habanaai
git checkout 389aaa2864706e8aa53576642d95761c90861171
vim +5907 drivers/misc/habanalabs/gaudi/gaudi.c

389aaa2864706e Oded Gabbay 2020-05-11  5869  static void gaudi_print_ecc_in=
fo(struct hl_device *hdev, u16 event_type)
389aaa2864706e Oded Gabbay 2020-05-11  5870  {
389aaa2864706e Oded Gabbay 2020-05-11  5871  	u64 block_address;
389aaa2864706e Oded Gabbay 2020-05-11  5872  	u8 index;
389aaa2864706e Oded Gabbay 2020-05-11  5873  	int num_memories;
389aaa2864706e Oded Gabbay 2020-05-11  5874  	char desc[32];
389aaa2864706e Oded Gabbay 2020-05-11  5875  	bool derr;
389aaa2864706e Oded Gabbay 2020-05-11  5876  	bool disable_clock_gating;
389aaa2864706e Oded Gabbay 2020-05-11  5877  =

389aaa2864706e Oded Gabbay 2020-05-11  5878  	switch (event_type) {
389aaa2864706e Oded Gabbay 2020-05-11  5879  	case GAUDI_EVENT_PCIE_CORE_SE=
RR:
389aaa2864706e Oded Gabbay 2020-05-11  5880  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s", "PCIE_CORE");
389aaa2864706e Oded Gabbay 2020-05-11  5881  		block_address =3D mmPCIE_COR=
E_BASE;
389aaa2864706e Oded Gabbay 2020-05-11  5882  		num_memories =3D 51;
389aaa2864706e Oded Gabbay 2020-05-11  5883  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  5884  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  5885  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5886  	case GAUDI_EVENT_PCIE_CORE_DE=
RR:
389aaa2864706e Oded Gabbay 2020-05-11  5887  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s", "PCIE_CORE");
389aaa2864706e Oded Gabbay 2020-05-11  5888  		block_address =3D mmPCIE_COR=
E_BASE;
389aaa2864706e Oded Gabbay 2020-05-11  5889  		num_memories =3D 51;
389aaa2864706e Oded Gabbay 2020-05-11  5890  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  5891  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  5892  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5893  	case GAUDI_EVENT_PCIE_IF_SERR:
389aaa2864706e Oded Gabbay 2020-05-11  5894  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s", "PCIE_WRAP");
389aaa2864706e Oded Gabbay 2020-05-11  5895  		block_address =3D mmPCIE_WRA=
P_BASE;
389aaa2864706e Oded Gabbay 2020-05-11  5896  		num_memories =3D 11;
389aaa2864706e Oded Gabbay 2020-05-11  5897  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  5898  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  5899  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5900  	case GAUDI_EVENT_PCIE_IF_DERR:
389aaa2864706e Oded Gabbay 2020-05-11  5901  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s", "PCIE_WRAP");
389aaa2864706e Oded Gabbay 2020-05-11  5902  		block_address =3D mmPCIE_WRA=
P_BASE;
389aaa2864706e Oded Gabbay 2020-05-11  5903  		num_memories =3D 11;
389aaa2864706e Oded Gabbay 2020-05-11  5904  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  5905  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  5906  		break;
389aaa2864706e Oded Gabbay 2020-05-11 @5907  		return;
                                                        ^^^^^^
Unreachable and misleading.

389aaa2864706e Oded Gabbay 2020-05-11  5908  	case GAUDI_EVENT_PCIE_PHY_SER=
R:
389aaa2864706e Oded Gabbay 2020-05-11  5909  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s", "PCIE_PHY");
389aaa2864706e Oded Gabbay 2020-05-11  5910  		block_address =3D mmPCIE_PHY=
_BASE;
389aaa2864706e Oded Gabbay 2020-05-11  5911  		num_memories =3D 4;
389aaa2864706e Oded Gabbay 2020-05-11  5912  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  5913  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  5914  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5915  	case GAUDI_EVENT_PCIE_PHY_DER=
R:
389aaa2864706e Oded Gabbay 2020-05-11  5916  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s", "PCIE_PHY");
389aaa2864706e Oded Gabbay 2020-05-11  5917  		block_address =3D mmPCIE_PHY=
_BASE;
389aaa2864706e Oded Gabbay 2020-05-11  5918  		num_memories =3D 4;
389aaa2864706e Oded Gabbay 2020-05-11  5919  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  5920  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  5921  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5922  	case GAUDI_EVENT_TPC0_SERR ..=
. GAUDI_EVENT_TPC7_SERR:
389aaa2864706e Oded Gabbay 2020-05-11  5923  		index =3D event_type - GAUDI=
_EVENT_TPC0_SERR;
389aaa2864706e Oded Gabbay 2020-05-11  5924  		block_address =3D mmTPC0_CFG=
_BASE + index * TPC_CFG_OFFSET;
389aaa2864706e Oded Gabbay 2020-05-11  5925  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s%d", "TPC", index);
389aaa2864706e Oded Gabbay 2020-05-11  5926  		num_memories =3D 90;
389aaa2864706e Oded Gabbay 2020-05-11  5927  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  5928  		disable_clock_gating =3D tru=
e;
389aaa2864706e Oded Gabbay 2020-05-11  5929  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5930  	case GAUDI_EVENT_TPC0_DERR ..=
. GAUDI_EVENT_TPC7_DERR:
389aaa2864706e Oded Gabbay 2020-05-11  5931  		index =3D event_type - GAUDI=
_EVENT_TPC0_DERR;
389aaa2864706e Oded Gabbay 2020-05-11  5932  		block_address =3D
389aaa2864706e Oded Gabbay 2020-05-11  5933  			mmTPC0_CFG_BASE + index * T=
PC_CFG_OFFSET;
389aaa2864706e Oded Gabbay 2020-05-11  5934  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s%d", "TPC", index);
389aaa2864706e Oded Gabbay 2020-05-11  5935  		num_memories =3D 90;
389aaa2864706e Oded Gabbay 2020-05-11  5936  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  5937  		disable_clock_gating =3D tru=
e;
389aaa2864706e Oded Gabbay 2020-05-11  5938  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5939  	case GAUDI_EVENT_MME0_ACC_SER=
R:
389aaa2864706e Oded Gabbay 2020-05-11  5940  	case GAUDI_EVENT_MME1_ACC_SER=
R:
389aaa2864706e Oded Gabbay 2020-05-11  5941  	case GAUDI_EVENT_MME2_ACC_SER=
R:
389aaa2864706e Oded Gabbay 2020-05-11  5942  	case GAUDI_EVENT_MME3_ACC_SER=
R:
389aaa2864706e Oded Gabbay 2020-05-11  5943  		index =3D (event_type - GAUD=
I_EVENT_MME0_ACC_SERR) / 4;
389aaa2864706e Oded Gabbay 2020-05-11  5944  		block_address =3D mmMME0_ACC=
_BASE + index * MME_ACC_OFFSET;
389aaa2864706e Oded Gabbay 2020-05-11  5945  		snprintf(desc, ARRAY_SIZE(de=
sc), "MME%d_ACC", index);
389aaa2864706e Oded Gabbay 2020-05-11  5946  		num_memories =3D 128;
389aaa2864706e Oded Gabbay 2020-05-11  5947  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  5948  		disable_clock_gating =3D tru=
e;
389aaa2864706e Oded Gabbay 2020-05-11  5949  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5950  	case GAUDI_EVENT_MME0_ACC_DER=
R:
389aaa2864706e Oded Gabbay 2020-05-11  5951  	case GAUDI_EVENT_MME1_ACC_DER=
R:
389aaa2864706e Oded Gabbay 2020-05-11  5952  	case GAUDI_EVENT_MME2_ACC_DER=
R:
389aaa2864706e Oded Gabbay 2020-05-11  5953  	case GAUDI_EVENT_MME3_ACC_DER=
R:
389aaa2864706e Oded Gabbay 2020-05-11  5954  		index =3D (event_type - GAUD=
I_EVENT_MME0_ACC_DERR) / 4;
389aaa2864706e Oded Gabbay 2020-05-11  5955  		block_address =3D mmMME0_ACC=
_BASE + index * MME_ACC_OFFSET;
389aaa2864706e Oded Gabbay 2020-05-11  5956  		snprintf(desc, ARRAY_SIZE(de=
sc), "MME%d_ACC", index);
389aaa2864706e Oded Gabbay 2020-05-11  5957  		num_memories =3D 128;
389aaa2864706e Oded Gabbay 2020-05-11  5958  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  5959  		disable_clock_gating =3D tru=
e;
389aaa2864706e Oded Gabbay 2020-05-11  5960  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5961  	case GAUDI_EVENT_MME0_SBAB_SE=
RR:
389aaa2864706e Oded Gabbay 2020-05-11  5962  	case GAUDI_EVENT_MME1_SBAB_SE=
RR:
389aaa2864706e Oded Gabbay 2020-05-11  5963  	case GAUDI_EVENT_MME2_SBAB_SE=
RR:
389aaa2864706e Oded Gabbay 2020-05-11  5964  	case GAUDI_EVENT_MME3_SBAB_SE=
RR:
389aaa2864706e Oded Gabbay 2020-05-11  5965  		index =3D (event_type - GAUD=
I_EVENT_MME0_SBAB_SERR) / 4;
389aaa2864706e Oded Gabbay 2020-05-11  5966  		block_address =3D mmMME0_SBA=
B_BASE + index * MME_ACC_OFFSET;
389aaa2864706e Oded Gabbay 2020-05-11  5967  		snprintf(desc, ARRAY_SIZE(de=
sc), "MME%d_SBAB", index);
389aaa2864706e Oded Gabbay 2020-05-11  5968  		num_memories =3D 33;
389aaa2864706e Oded Gabbay 2020-05-11  5969  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  5970  		disable_clock_gating =3D tru=
e;
389aaa2864706e Oded Gabbay 2020-05-11  5971  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5972  	case GAUDI_EVENT_MME0_SBAB_DE=
RR:
389aaa2864706e Oded Gabbay 2020-05-11  5973  	case GAUDI_EVENT_MME1_SBAB_DE=
RR:
389aaa2864706e Oded Gabbay 2020-05-11  5974  	case GAUDI_EVENT_MME2_SBAB_DE=
RR:
389aaa2864706e Oded Gabbay 2020-05-11  5975  	case GAUDI_EVENT_MME3_SBAB_DE=
RR:
389aaa2864706e Oded Gabbay 2020-05-11  5976  		index =3D (event_type - GAUD=
I_EVENT_MME0_SBAB_DERR) / 4;
389aaa2864706e Oded Gabbay 2020-05-11  5977  		block_address =3D mmMME0_SBA=
B_BASE + index * MME_ACC_OFFSET;
389aaa2864706e Oded Gabbay 2020-05-11  5978  		snprintf(desc, ARRAY_SIZE(de=
sc), "MME%d_SBAB", index);
389aaa2864706e Oded Gabbay 2020-05-11  5979  		num_memories =3D 33;
389aaa2864706e Oded Gabbay 2020-05-11  5980  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  5981  		disable_clock_gating =3D tru=
e;
389aaa2864706e Oded Gabbay 2020-05-11  5982  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5983  	case GAUDI_EVENT_DMA0_SERR_EC=
C ... GAUDI_EVENT_DMA7_SERR_ECC:
389aaa2864706e Oded Gabbay 2020-05-11  5984  		index =3D event_type - GAUDI=
_EVENT_DMA0_SERR_ECC;
389aaa2864706e Oded Gabbay 2020-05-11  5985  		block_address =3D mmDMA0_COR=
E_BASE + index * DMA_CORE_OFFSET;
389aaa2864706e Oded Gabbay 2020-05-11  5986  		snprintf(desc, ARRAY_SIZE(de=
sc), "DMA%d_CORE", index);
389aaa2864706e Oded Gabbay 2020-05-11  5987  		num_memories =3D 16;
389aaa2864706e Oded Gabbay 2020-05-11  5988  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  5989  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  5990  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5991  	case GAUDI_EVENT_DMA0_DERR_EC=
C ... GAUDI_EVENT_DMA7_DERR_ECC:
389aaa2864706e Oded Gabbay 2020-05-11  5992  		index =3D event_type - GAUDI=
_EVENT_DMA0_DERR_ECC;
389aaa2864706e Oded Gabbay 2020-05-11  5993  		block_address =3D mmDMA0_COR=
E_BASE + index * DMA_CORE_OFFSET;
389aaa2864706e Oded Gabbay 2020-05-11  5994  		snprintf(desc, ARRAY_SIZE(de=
sc), "DMA%d_CORE", index);
389aaa2864706e Oded Gabbay 2020-05-11  5995  		num_memories =3D 16;
389aaa2864706e Oded Gabbay 2020-05-11  5996  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  5997  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  5998  		break;
389aaa2864706e Oded Gabbay 2020-05-11  5999  	case GAUDI_EVENT_CPU_IF_ECC_S=
ERR:
389aaa2864706e Oded Gabbay 2020-05-11  6000  		block_address =3D mmCPU_IF_B=
ASE;
389aaa2864706e Oded Gabbay 2020-05-11  6001  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s", "CPU");
389aaa2864706e Oded Gabbay 2020-05-11  6002  		num_memories =3D 4;
389aaa2864706e Oded Gabbay 2020-05-11  6003  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  6004  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  6005  		break;
389aaa2864706e Oded Gabbay 2020-05-11  6006  	case GAUDI_EVENT_CPU_IF_ECC_D=
ERR:
389aaa2864706e Oded Gabbay 2020-05-11  6007  		block_address =3D mmCPU_IF_B=
ASE;
389aaa2864706e Oded Gabbay 2020-05-11  6008  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s", "CPU");
389aaa2864706e Oded Gabbay 2020-05-11  6009  		num_memories =3D 4;
389aaa2864706e Oded Gabbay 2020-05-11  6010  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  6011  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  6012  		break;
389aaa2864706e Oded Gabbay 2020-05-11  6013  	case GAUDI_EVENT_PSOC_MEM_SER=
R:
389aaa2864706e Oded Gabbay 2020-05-11  6014  		block_address =3D mmPSOC_GLO=
BAL_CONF_BASE;
389aaa2864706e Oded Gabbay 2020-05-11  6015  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s", "CPU");
389aaa2864706e Oded Gabbay 2020-05-11  6016  		num_memories =3D 4;
389aaa2864706e Oded Gabbay 2020-05-11  6017  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  6018  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  6019  		break;
389aaa2864706e Oded Gabbay 2020-05-11  6020  	case GAUDI_EVENT_PSOC_MEM_DER=
R:
389aaa2864706e Oded Gabbay 2020-05-11  6021  		block_address =3D mmPSOC_GLO=
BAL_CONF_BASE;
389aaa2864706e Oded Gabbay 2020-05-11  6022  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s", "CPU");
389aaa2864706e Oded Gabbay 2020-05-11  6023  		num_memories =3D 4;
389aaa2864706e Oded Gabbay 2020-05-11  6024  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  6025  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  6026  		break;
389aaa2864706e Oded Gabbay 2020-05-11  6027  	case GAUDI_EVENT_PSOC_CORESIG=
HT_SERR:
389aaa2864706e Oded Gabbay 2020-05-11  6028  		block_address =3D mmPSOC_CS_=
TRACE_BASE;
389aaa2864706e Oded Gabbay 2020-05-11  6029  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s", "CPU");
389aaa2864706e Oded Gabbay 2020-05-11  6030  		num_memories =3D 2;
389aaa2864706e Oded Gabbay 2020-05-11  6031  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  6032  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  6033  		break;
389aaa2864706e Oded Gabbay 2020-05-11  6034  	case GAUDI_EVENT_PSOC_CORESIG=
HT_DERR:
389aaa2864706e Oded Gabbay 2020-05-11  6035  		block_address =3D mmPSOC_CS_=
TRACE_BASE;
389aaa2864706e Oded Gabbay 2020-05-11  6036  		snprintf(desc, ARRAY_SIZE(de=
sc), "%s", "CPU");
389aaa2864706e Oded Gabbay 2020-05-11  6037  		num_memories =3D 2;
389aaa2864706e Oded Gabbay 2020-05-11  6038  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  6039  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  6040  		break;
389aaa2864706e Oded Gabbay 2020-05-11  6041  	case GAUDI_EVENT_SRAM0_SERR .=
.. GAUDI_EVENT_SRAM28_SERR:
389aaa2864706e Oded Gabbay 2020-05-11  6042  		index =3D event_type - GAUDI=
_EVENT_SRAM0_SERR;
389aaa2864706e Oded Gabbay 2020-05-11  6043  		block_address =3D
389aaa2864706e Oded Gabbay 2020-05-11  6044  			mmSRAM_Y0_X0_BANK_BASE + in=
dex * SRAM_BANK_OFFSET;
389aaa2864706e Oded Gabbay 2020-05-11  6045  		snprintf(desc, ARRAY_SIZE(de=
sc), "SRAM%d", index);
389aaa2864706e Oded Gabbay 2020-05-11  6046  		num_memories =3D 2;
389aaa2864706e Oded Gabbay 2020-05-11  6047  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  6048  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  6049  		break;
389aaa2864706e Oded Gabbay 2020-05-11  6050  	case GAUDI_EVENT_SRAM0_DERR .=
.. GAUDI_EVENT_SRAM28_DERR:
389aaa2864706e Oded Gabbay 2020-05-11  6051  		index =3D event_type - GAUDI=
_EVENT_SRAM0_DERR;
389aaa2864706e Oded Gabbay 2020-05-11  6052  		block_address =3D
389aaa2864706e Oded Gabbay 2020-05-11  6053  			mmSRAM_Y0_X0_BANK_BASE + in=
dex * SRAM_BANK_OFFSET;
389aaa2864706e Oded Gabbay 2020-05-11  6054  		snprintf(desc, ARRAY_SIZE(de=
sc), "SRAM%d", index);
389aaa2864706e Oded Gabbay 2020-05-11  6055  		num_memories =3D 2;
389aaa2864706e Oded Gabbay 2020-05-11  6056  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  6057  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  6058  		break;
389aaa2864706e Oded Gabbay 2020-05-11  6059  	case GAUDI_EVENT_DMA_IF0_SERR=
 ... GAUDI_EVENT_DMA_IF3_SERR:
389aaa2864706e Oded Gabbay 2020-05-11  6060  		index =3D event_type - GAUDI=
_EVENT_DMA_IF0_SERR;
389aaa2864706e Oded Gabbay 2020-05-11  6061  		block_address =3D mmDMA_IF_W=
_S_BASE +
389aaa2864706e Oded Gabbay 2020-05-11  6062  				index * (mmDMA_IF_E_S_BASE=
 - mmDMA_IF_W_S_BASE);
389aaa2864706e Oded Gabbay 2020-05-11  6063  		snprintf(desc, ARRAY_SIZE(de=
sc), "DMA_IF%d", index);
389aaa2864706e Oded Gabbay 2020-05-11  6064  		num_memories =3D 60;
389aaa2864706e Oded Gabbay 2020-05-11  6065  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  6066  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  6067  		break;
389aaa2864706e Oded Gabbay 2020-05-11  6068  	case GAUDI_EVENT_DMA_IF0_DERR=
 ... GAUDI_EVENT_DMA_IF3_DERR:
389aaa2864706e Oded Gabbay 2020-05-11  6069  		index =3D event_type - GAUDI=
_EVENT_DMA_IF0_DERR;
389aaa2864706e Oded Gabbay 2020-05-11  6070  		block_address =3D mmDMA_IF_W=
_S_BASE +
389aaa2864706e Oded Gabbay 2020-05-11  6071  				index * (mmDMA_IF_E_S_BASE=
 - mmDMA_IF_W_S_BASE);
389aaa2864706e Oded Gabbay 2020-05-11  6072  		snprintf(desc, ARRAY_SIZE(de=
sc), "DMA_IF%d", index);
389aaa2864706e Oded Gabbay 2020-05-11  6073  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  6074  		num_memories =3D 60;
389aaa2864706e Oded Gabbay 2020-05-11  6075  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  6076  		break;
389aaa2864706e Oded Gabbay 2020-05-11  6077  	case GAUDI_EVENT_HBM_0_SERR .=
.. GAUDI_EVENT_HBM_3_SERR:
389aaa2864706e Oded Gabbay 2020-05-11  6078  		index =3D event_type - GAUDI=
_EVENT_HBM_0_SERR;
389aaa2864706e Oded Gabbay 2020-05-11  6079  		/* HBM Registers are at diff=
erent offsets */
389aaa2864706e Oded Gabbay 2020-05-11  6080  		block_address =3D mmHBM0_BAS=
E + 0x8000 +
389aaa2864706e Oded Gabbay 2020-05-11  6081  				index * (mmHBM1_BASE - mmH=
BM0_BASE);
389aaa2864706e Oded Gabbay 2020-05-11  6082  		snprintf(desc, ARRAY_SIZE(de=
sc), "HBM%d", index);
389aaa2864706e Oded Gabbay 2020-05-11  6083  		derr =3D false;
389aaa2864706e Oded Gabbay 2020-05-11  6084  		num_memories =3D 64;
389aaa2864706e Oded Gabbay 2020-05-11  6085  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  6086  		break;
389aaa2864706e Oded Gabbay 2020-05-11  6087  	case GAUDI_EVENT_HBM_0_DERR .=
.. GAUDI_EVENT_HBM_3_DERR:
389aaa2864706e Oded Gabbay 2020-05-11  6088  		index =3D event_type - GAUDI=
_EVENT_HBM_0_SERR;
389aaa2864706e Oded Gabbay 2020-05-11  6089  		/* HBM Registers are at diff=
erent offsets */
389aaa2864706e Oded Gabbay 2020-05-11  6090  		block_address =3D mmHBM0_BAS=
E + 0x8000 +
389aaa2864706e Oded Gabbay 2020-05-11  6091  				index * (mmHBM1_BASE - mmH=
BM0_BASE);
389aaa2864706e Oded Gabbay 2020-05-11  6092  		snprintf(desc, ARRAY_SIZE(de=
sc), "HBM%d", index);
389aaa2864706e Oded Gabbay 2020-05-11  6093  		derr =3D true;
389aaa2864706e Oded Gabbay 2020-05-11  6094  		num_memories =3D 64;
389aaa2864706e Oded Gabbay 2020-05-11  6095  		disable_clock_gating =3D fal=
se;
389aaa2864706e Oded Gabbay 2020-05-11  6096  		break;
389aaa2864706e Oded Gabbay 2020-05-11  6097  	default:
389aaa2864706e Oded Gabbay 2020-05-11  6098  		return;
389aaa2864706e Oded Gabbay 2020-05-11  6099  	}
389aaa2864706e Oded Gabbay 2020-05-11  6100  =

389aaa2864706e Oded Gabbay 2020-05-11  6101  	gaudi_print_ecc_info_generic(=
hdev, desc, block_address, num_memories,
389aaa2864706e Oded Gabbay 2020-05-11  6102  					derr, disable_clock_gatin=
g);
389aaa2864706e Oded Gabbay 2020-05-11  6103  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1191239544965902888==--


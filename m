Content-Type: multipart/mixed; boundary="===============3353021329964618356=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:871 iwl_dbg_tlv_apply_config() error: call of '__iwl_err' with no format argument
Date: Sun, 27 Feb 2022 03:15:04 +0800
Message-ID: <202202270253.ZLJRWYpx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3353021329964618356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mukesh Sisodiya <mukesh.sisodiya@intel.com>
CC: Luca Coelho <luciano.coelho@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9137eda53752ef73148e42b0d7640a00f1bc96b1
commit: 1a5daead217c4b2243e6ab061e19a1190e4325ac iwlwifi: yoyo: support for=
 ROM usniffer
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: ia64-randconfig-m031-20220220 (https://download.01.org/0day-ci/arch=
ive/20220227/202202270253.ZLJRWYpx-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:871 iwl_dbg_tlv_apply_conf=
ig() error: call of '__iwl_err' with no format argument

Old smatch warnings:
drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:933 iwl_dbg_tlv_set_period=
ic_trigs() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:949 iwl_dbg_tlv_set_period=
ic_trigs() error: call of '__iwl_err' with no format argument

vim +/__iwl_err +871 drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c

cf29c5b66b9f83 Shahar S Matityahu 2019-07-23  800  =

f21baf244112e6 Mukesh Sisodiya    2021-10-17  801  static void iwl_dbg_tlv_=
apply_config(struct iwl_fw_runtime *fwrt,
f21baf244112e6 Mukesh Sisodiya    2021-10-17  802  				     struct list_hea=
d *config_list)
f21baf244112e6 Mukesh Sisodiya    2021-10-17  803  {
f21baf244112e6 Mukesh Sisodiya    2021-10-17  804  	struct iwl_dbg_tlv_node=
 *node;
f21baf244112e6 Mukesh Sisodiya    2021-10-17  805  =

f21baf244112e6 Mukesh Sisodiya    2021-10-17  806  	list_for_each_entry(nod=
e, config_list, list) {
f21baf244112e6 Mukesh Sisodiya    2021-10-17  807  		struct iwl_fw_ini_conf=
_set_tlv *config_list =3D (void *)node->tlv.data;
1a5daead217c4b Mukesh Sisodiya    2021-10-24  808  		u32 count, address, va=
lue;
1a5daead217c4b Mukesh Sisodiya    2021-10-24  809  		u32 len =3D (le32_to_c=
pu(node->tlv.length) - sizeof(*config_list)) / 8;
f21baf244112e6 Mukesh Sisodiya    2021-10-17  810  		u32 type =3D le32_to_c=
pu(config_list->set_type);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  811  		u32 offset =3D le32_to=
_cpu(config_list->addr_offset);
f21baf244112e6 Mukesh Sisodiya    2021-10-17  812  =

f21baf244112e6 Mukesh Sisodiya    2021-10-17  813  		switch (type) {
1a5daead217c4b Mukesh Sisodiya    2021-10-24  814  		case IWL_FW_INI_CONFIG=
_SET_TYPE_DEVICE_PERIPHERY_MAC: {
1a5daead217c4b Mukesh Sisodiya    2021-10-24  815  			if (!iwl_trans_grab_n=
ic_access(fwrt->trans)) {
1a5daead217c4b Mukesh Sisodiya    2021-10-24  816  				IWL_DEBUG_FW(fwrt, "=
WRT: failed to get nic access\n");
1a5daead217c4b Mukesh Sisodiya    2021-10-24  817  				IWL_DEBUG_FW(fwrt, "=
WRT: skipping MAC PERIPHERY config\n");
1a5daead217c4b Mukesh Sisodiya    2021-10-24  818  				continue;
1a5daead217c4b Mukesh Sisodiya    2021-10-24  819  			}
1a5daead217c4b Mukesh Sisodiya    2021-10-24  820  			IWL_DEBUG_FW(fwrt, "W=
RT:  MAC PERIPHERY config len: len %u\n", len);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  821  			for (count =3D 0; cou=
nt < len; count++) {
1a5daead217c4b Mukesh Sisodiya    2021-10-24  822  				address =3D le32_to_=
cpu(config_list->addr_val[count].address);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  823  				value =3D le32_to_cp=
u(config_list->addr_val[count].value);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  824  				iwl_trans_write_prph=
(fwrt->trans, address + offset, value);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  825  			}
1a5daead217c4b Mukesh Sisodiya    2021-10-24  826  			iwl_trans_release_nic=
_access(fwrt->trans);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  827  		break;
1a5daead217c4b Mukesh Sisodiya    2021-10-24  828  		}
1a5daead217c4b Mukesh Sisodiya    2021-10-24  829  		case IWL_FW_INI_CONFIG=
_SET_TYPE_DEVICE_MEMORY: {
1a5daead217c4b Mukesh Sisodiya    2021-10-24  830  			for (count =3D 0; cou=
nt < len; count++) {
1a5daead217c4b Mukesh Sisodiya    2021-10-24  831  				address =3D le32_to_=
cpu(config_list->addr_val[count].address);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  832  				value =3D le32_to_cp=
u(config_list->addr_val[count].value);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  833  				iwl_trans_write_mem3=
2(fwrt->trans, address + offset, value);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  834  				IWL_DEBUG_FW(fwrt, "=
WRT: DEV_MEM: count %u, add: %u val: %u\n",
1a5daead217c4b Mukesh Sisodiya    2021-10-24  835  					     count, address=
, value);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  836  			}
1a5daead217c4b Mukesh Sisodiya    2021-10-24  837  		break;
1a5daead217c4b Mukesh Sisodiya    2021-10-24  838  		}
1a5daead217c4b Mukesh Sisodiya    2021-10-24  839  		case IWL_FW_INI_CONFIG=
_SET_TYPE_CSR: {
1a5daead217c4b Mukesh Sisodiya    2021-10-24  840  			for (count =3D 0; cou=
nt < len; count++) {
1a5daead217c4b Mukesh Sisodiya    2021-10-24  841  				address =3D le32_to_=
cpu(config_list->addr_val[count].address);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  842  				value =3D le32_to_cp=
u(config_list->addr_val[count].value);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  843  				iwl_write32(fwrt->tr=
ans, address + offset, value);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  844  				IWL_DEBUG_FW(fwrt, "=
WRT: CSR: count %u, add: %u val: %u\n",
1a5daead217c4b Mukesh Sisodiya    2021-10-24  845  					     count, address=
, value);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  846  			}
1a5daead217c4b Mukesh Sisodiya    2021-10-24  847  		break;
1a5daead217c4b Mukesh Sisodiya    2021-10-24  848  		}
1a5daead217c4b Mukesh Sisodiya    2021-10-24  849  		case IWL_FW_INI_CONFIG=
_SET_TYPE_DBGC_DRAM_ADDR: {
1a5daead217c4b Mukesh Sisodiya    2021-10-24  850  			struct iwl_dbgc1_info=
 dram_info =3D {};
1a5daead217c4b Mukesh Sisodiya    2021-10-24  851  			struct iwl_dram_data =
*frags =3D &fwrt->trans->dbg.fw_mon_ini[1].frags[0];
1a5daead217c4b Mukesh Sisodiya    2021-10-24  852  			__le64 dram_base_addr=
 =3D cpu_to_le64(frags->physical);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  853  			__le32 dram_size =3D =
cpu_to_le32(frags->size);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  854  			u64  dram_addr =3D le=
64_to_cpu(dram_base_addr);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  855  			u32 ret;
1a5daead217c4b Mukesh Sisodiya    2021-10-24  856  =

1a5daead217c4b Mukesh Sisodiya    2021-10-24  857  			IWL_DEBUG_FW(fwrt, "W=
RT: dram_base_addr 0x%016llx, dram_size 0x%x\n",
1a5daead217c4b Mukesh Sisodiya    2021-10-24  858  				     dram_base_addr,=
 dram_size);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  859  			IWL_DEBUG_FW(fwrt, "W=
RT: config_list->addr_offset: %u\n",
1a5daead217c4b Mukesh Sisodiya    2021-10-24  860  				     le32_to_cpu(con=
fig_list->addr_offset));
1a5daead217c4b Mukesh Sisodiya    2021-10-24  861  			for (count =3D 0; cou=
nt < len; count++) {
1a5daead217c4b Mukesh Sisodiya    2021-10-24  862  				address =3D le32_to_=
cpu(config_list->addr_val[count].address);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  863  				dram_info.dbgc1_add_=
lsb =3D
1a5daead217c4b Mukesh Sisodiya    2021-10-24  864  					cpu_to_le32((dram_a=
ddr & 0x00000000FFFFFFFFULL) + 0x400);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  865  				dram_info.dbgc1_add_=
msb =3D
1a5daead217c4b Mukesh Sisodiya    2021-10-24  866  					cpu_to_le32((dram_a=
ddr & 0xFFFFFFFF00000000ULL) >> 32);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  867  				dram_info.dbgc1_size=
 =3D cpu_to_le32(le32_to_cpu(dram_size) - 0x400);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  868  				ret =3D iwl_trans_wr=
ite_mem(fwrt->trans,
1a5daead217c4b Mukesh Sisodiya    2021-10-24  869  							  address + offse=
t, &dram_info, 4);
1a5daead217c4b Mukesh Sisodiya    2021-10-24  870  				if (ret) {
1a5daead217c4b Mukesh Sisodiya    2021-10-24 @871  					IWL_ERR(fwrt, "Fail=
ed to write dram_info to HW_SMEM\n");
1a5daead217c4b Mukesh Sisodiya    2021-10-24  872  					break;
1a5daead217c4b Mukesh Sisodiya    2021-10-24  873  				}
1a5daead217c4b Mukesh Sisodiya    2021-10-24  874  			}
1a5daead217c4b Mukesh Sisodiya    2021-10-24  875  			break;
1a5daead217c4b Mukesh Sisodiya    2021-10-24  876  		}
f21baf244112e6 Mukesh Sisodiya    2021-10-17  877  		case IWL_FW_INI_CONFIG=
_SET_TYPE_PERIPH_SCRATCH_HWM: {
f21baf244112e6 Mukesh Sisodiya    2021-10-17  878  			u32 debug_token_confi=
g =3D
f21baf244112e6 Mukesh Sisodiya    2021-10-17  879  				le32_to_cpu(config_l=
ist->addr_val[0].value);
f21baf244112e6 Mukesh Sisodiya    2021-10-17  880  =

f21baf244112e6 Mukesh Sisodiya    2021-10-17  881  			IWL_DEBUG_FW(fwrt, "W=
RT: Setting HWM debug token config: %u\n",
f21baf244112e6 Mukesh Sisodiya    2021-10-17  882  				     debug_token_con=
fig);
f21baf244112e6 Mukesh Sisodiya    2021-10-17  883  			fwrt->trans->dbg.ucod=
e_preset =3D debug_token_config;
f21baf244112e6 Mukesh Sisodiya    2021-10-17  884  			break;
f21baf244112e6 Mukesh Sisodiya    2021-10-17  885  		}
f21baf244112e6 Mukesh Sisodiya    2021-10-17  886  		default:
f21baf244112e6 Mukesh Sisodiya    2021-10-17  887  			break;
f21baf244112e6 Mukesh Sisodiya    2021-10-17  888  		}
f21baf244112e6 Mukesh Sisodiya    2021-10-17  889  	}
f21baf244112e6 Mukesh Sisodiya    2021-10-17  890  }
f21baf244112e6 Mukesh Sisodiya    2021-10-17  891  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3353021329964618356==--


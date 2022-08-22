Content-Type: multipart/mixed; boundary="===============1598921740982137432=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soundwire/qcom.c:478 qcom_swrm_enumerate() error: buffer overflow 'ctrl->status' 11 <= 11
Date: Mon, 22 Aug 2022 13:14:51 +0800
Message-ID: <202208221349.sVvFmJZv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1598921740982137432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1c23f9e627a7b412978b4e852793c5e3c3efc555
commit: aa1262ca66957183ea1fb32a067e145b995f3744 soundwire: qcom: Check dev=
ice status before reading devid
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-m031-20220819 (https://download.01.org/0day-ci/arc=
hive/20220822/202208221349.sVvFmJZv-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/soundwire/qcom.c:478 qcom_swrm_enumerate() error: buffer overflow '=
ctrl->status' 11 <=3D 11

Old smatch warnings:
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: in=
consistent indenting
drivers/soundwire/qcom.c:1323 qcom_swrm_probe() warn: passing zero to 'PTR_=
ERR'

vim +478 drivers/soundwire/qcom.c

a6e6581942caa0 Srinivas Kandagatla 2021-03-30  464  =

a6e6581942caa0 Srinivas Kandagatla 2021-03-30  465  static int qcom_swrm_en=
umerate(struct sdw_bus *bus)
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  466  {
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  467  	struct qcom_swrm_ctrl =
*ctrl =3D to_qcom_sdw(bus);
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  468  	struct sdw_slave *slav=
e, *_s;
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  469  	struct sdw_slave_id id;
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  470  	u32 val1, val2;
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  471  	bool found;
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  472  	u64 addr;
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  473  	int i;
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  474  	char *buf1 =3D (char *=
)&val1, *buf2 =3D (char *)&val2;
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  475  =

a6e6581942caa0 Srinivas Kandagatla 2021-03-30  476  	for (i =3D 1; i <=3D S=
DW_MAX_DEVICES; i++) {
aa1262ca669571 Srinivas Kandagatla 2022-07-06  477  		/* do not continue if=
 the status is Not Present  */
aa1262ca669571 Srinivas Kandagatla 2022-07-06 @478  		if (!ctrl->status[i])
aa1262ca669571 Srinivas Kandagatla 2022-07-06  479  			continue;
aa1262ca669571 Srinivas Kandagatla 2022-07-06  480  =

a6e6581942caa0 Srinivas Kandagatla 2021-03-30  481  		/*SCP_Devid5 - Devid =
4*/
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  482  		ctrl->reg_read(ctrl, =
SWRM_ENUMERATOR_SLAVE_DEV_ID_1(i), &val1);
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  483  =

a6e6581942caa0 Srinivas Kandagatla 2021-03-30  484  		/*SCP_Devid3 - DevId =
2 Devid 1 Devid 0*/
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  485  		ctrl->reg_read(ctrl, =
SWRM_ENUMERATOR_SLAVE_DEV_ID_2(i), &val2);
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  486  =

a6e6581942caa0 Srinivas Kandagatla 2021-03-30  487  		if (!val1 && !val2)
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  488  			break;
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  489  =

a6e6581942caa0 Srinivas Kandagatla 2021-03-30  490  		addr =3D buf2[1] | (b=
uf2[0] << 8) | (buf1[3] << 16) |
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  491  			((u64)buf1[2] << 24)=
 | ((u64)buf1[1] << 32) |
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  492  			((u64)buf1[0] << 40);
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  493  =

a6e6581942caa0 Srinivas Kandagatla 2021-03-30  494  		sdw_extract_slave_id(=
bus, addr, &id);
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  495  		found =3D false;
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  496  		/* Now compare with e=
ntries */
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  497  		list_for_each_entry_s=
afe(slave, _s, &bus->slaves, node) {
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  498  			if (sdw_compare_devi=
d(slave, id) =3D=3D 0) {
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  499  				qcom_swrm_set_slave=
_dev_num(bus, slave, i);
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  500  				found =3D true;
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  501  				break;
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  502  			}
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  503  		}
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  504  =

a6e6581942caa0 Srinivas Kandagatla 2021-03-30  505  		if (!found) {
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  506  			qcom_swrm_set_slave_=
dev_num(bus, NULL, i);
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  507  			sdw_slave_add(bus, &=
id, NULL);
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  508  		}
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  509  	}
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  510  =

06dd96738d6183 Srinivas Kandagatla 2021-03-30  511  	complete(&ctrl->enumer=
ation);
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  512  	return 0;
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  513  }
a6e6581942caa0 Srinivas Kandagatla 2021-03-30  514  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1598921740982137432==--


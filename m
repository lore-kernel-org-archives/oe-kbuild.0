Content-Type: multipart/mixed; boundary="===============3645242879041763740=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:kvalo/ath/pending 52/91] drivers/net/wireless/ath/ath11k/debugfs.c:907 ath11k_write_fw_dbglog() warn: potential spectre issue 'ar->debug.module_id_bitmap' [w] (local cap)
Date: Fri, 25 Feb 2022 10:08:26 +0800
Message-ID: <202202251049.QhUTKOY2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3645242879041763740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://github.com/ammarfaizi2/linux-block kvalo/ath/pending
head:   dfc438d224e4ad756b276d79e5771c45b523156d
commit: f295ad912910e08d9b887a0c952f82d9612459d4 [52/91] ath11k: Add debugf=
s interface to configure firmware debug log level
:::::: branch date: 10 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-m031-20220223 (https://download.01.org/0day-ci/arc=
hive/20220225/202202251049.QhUTKOY2-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/ath/ath11k/debugfs.c:907 ath11k_write_fw_dbglog() warn=
: potential spectre issue 'ar->debug.module_id_bitmap' [w] (local cap)

vim +907 drivers/net/wireless/ath/ath11k/debugfs.c

da3a9d3c15769b Kalle Valo             2020-09-16  878  =

f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  879  static ssize_t ath11=
k_write_fw_dbglog(struct file *file,
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  880  				      const char=
 __user *user_buf,
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  881  				      size_t cou=
nt, loff_t *ppos)
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  882  {
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  883  	struct ath11k *ar =
=3D file->private_data;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  884  	char buf[128] =3D {=
0};
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  885  	struct ath11k_fw_db=
glog dbglog;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  886  	unsigned int param,=
 mod_id_index, is_end;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  887  	u64 value;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  888  	int ret, num;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  889  =

f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  890  	ret =3D simple_writ=
e_to_buffer(buf, sizeof(buf) - 1, ppos,
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  891  				     user_buf, c=
ount);
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  892  	if (ret <=3D 0)
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  893  		return ret;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  894  =

f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  895  	num =3D sscanf(buf,=
 "%u %llx %u %u", &param, &value, &mod_id_index, &is_end);
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  896  =

f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  897  	if (num < 2)
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  898  		return -EINVAL;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  899  =

f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  900  	mutex_lock(&ar->con=
f_mutex);
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  901  	if (param =3D=3D WM=
I_DEBUG_LOG_PARAM_MOD_ENABLE_BITMAP ||
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  902  	    param =3D=3D WM=
I_DEBUG_LOG_PARAM_WOW_MOD_ENABLE_BITMAP) {
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  903  		if (num !=3D 4 || =
mod_id_index > (MAX_MODULE_ID_BITMAP_WORDS - 1)) {
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  904  			ret =3D -EINVAL;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  905  			goto out;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  906  		}
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31 @907  		ar->debug.module_i=
d_bitmap[mod_id_index] =3D upper_32_bits(value);
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  908  		if (!is_end) {
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  909  			ret =3D count;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  910  			goto out;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  911  		}
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  912  	} else {
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  913  		if (num !=3D 2) {
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  914  			ret =3D -EINVAL;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  915  			goto out;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  916  		}
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  917  	}
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  918  =

f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  919  	dbglog.param =3D pa=
ram;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  920  	dbglog.value =3D lo=
wer_32_bits(value);
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  921  	ret =3D ath11k_wmi_=
fw_dbglog_cfg(ar, ar->debug.module_id_bitmap, &dbglog);
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  922  	if (ret) {
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  923  		ath11k_warn(ar->ab=
, "fw dbglog config failed from debugfs: %d\n",
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  924  			    ret);
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  925  		goto out;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  926  	}
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  927  =

f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  928  	ret =3D count;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  929  =

f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  930  out:
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  931  	mutex_unlock(&ar->c=
onf_mutex);
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  932  	return ret;
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  933  }
f295ad912910e0 Seevalamuthu Mariappan 2022-01-31  934  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3645242879041763740==--


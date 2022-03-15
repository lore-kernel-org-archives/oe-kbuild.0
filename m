Content-Type: multipart/mixed; boundary="===============5071213993944976795=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/qlogic/qed/qed_debug.c:7955 format_feature() error: uninitialized symbol 'txt_size_bytes'.
Date: Tue, 15 Mar 2022 15:04:35 +0800
Message-ID: <202203151436.SD0yCwVT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5071213993944976795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Prabhakar Kushwaha <pkushwaha@marvell.com>
CC: Ariel Elior <aelior@marvell.com>
CC: Shai Malin <smalin@marvell.com>
CC: Omkar Kulkarni <okulkarni@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: 6c95dd8f0aa1d983e857a755fca7001677d1dcb5 qed: Update debug related =
changes
date:   5 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-m031-20220313 (https://download.01.org/0day-ci/arc=
hive/20220315/202203151436.SD0yCwVT-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/qlogic/qed/qed_debug.c:7955 format_feature() error: un=
initialized symbol 'txt_size_bytes'.

Old smatch warnings:
drivers/net/ethernet/qlogic/qed/qed_debug.c:5262 qed_dbg_grc_config() warn:=
 unsigned 'grc_param' is never less than zero.
drivers/net/ethernet/qlogic/qed/qed_debug.c:8043 qed_dbg_dump() error: unin=
itialized symbol 'buf_size_dwords'.
drivers/net/ethernet/qlogic/qed/qed_debug.c:8637 qed_dbg_feature_size() err=
or: uninitialized symbol 'buf_size_dwords'.

vim +/txt_size_bytes +7955 drivers/net/ethernet/qlogic/qed/qed_debug.c

c965db44462919f Tomer Tayar        2016-09-07  7924  =

c965db44462919f Tomer Tayar        2016-09-07  7925  #define QED_RESULTS_BU=
F_MIN_SIZE 16
c965db44462919f Tomer Tayar        2016-09-07  7926  /* Generic function fo=
r decoding debug feature info */
8c93beaf5714b9d Yuval Mintz        2016-10-13  7927  static enum dbg_status=
 format_feature(struct qed_hwfn *p_hwfn,
c965db44462919f Tomer Tayar        2016-09-07  7928  				      enum qed_dbg=
_features feature_idx)
c965db44462919f Tomer Tayar        2016-09-07  7929  {
c965db44462919f Tomer Tayar        2016-09-07  7930  	struct qed_dbg_featur=
e *feature =3D
ca352f00756e7bd Igor Russkikh      2020-05-14  7931  	    &p_hwfn->cdev->db=
g_features[feature_idx];
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7932  	u32 txt_size_bytes, n=
ull_char_pos, i;
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7933  	u32 *dbuf, dwords;
c965db44462919f Tomer Tayar        2016-09-07  7934  	enum dbg_status rc;
c965db44462919f Tomer Tayar        2016-09-07  7935  	char *text_buf;
c965db44462919f Tomer Tayar        2016-09-07  7936  =

c965db44462919f Tomer Tayar        2016-09-07  7937  	/* Check if feature s=
upports formatting capability */
c965db44462919f Tomer Tayar        2016-09-07  7938  	if (!qed_features_loo=
kup[feature_idx].results_buf_size)
c965db44462919f Tomer Tayar        2016-09-07  7939  		return DBG_STATUS_OK;
c965db44462919f Tomer Tayar        2016-09-07  7940  =

6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7941  	dbuf =3D (u32 *)featu=
re->dump_buf;
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7942  	dwords =3D feature->d=
umped_dwords;
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7943  =

c965db44462919f Tomer Tayar        2016-09-07  7944  	/* Obtain size of for=
matted output */
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7945  	rc =3D qed_features_l=
ookup[feature_idx].results_buf_size(p_hwfn,
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7946  							       dbuf,
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7947  							       dwords,
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7948  							       &txt_siz=
e_bytes);
c965db44462919f Tomer Tayar        2016-09-07  7949  	if (rc !=3D DBG_STATU=
S_OK)
c965db44462919f Tomer Tayar        2016-09-07  7950  		return rc;
c965db44462919f Tomer Tayar        2016-09-07  7951  =

6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7952  	/* Make sure that the=
 allocated size is a multiple of dword
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7953  	 * (4 bytes).
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7954  	 */
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04 @7955  	null_char_pos =3D txt=
_size_bytes - 1;
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7956  	txt_size_bytes =3D (t=
xt_size_bytes + 3) & ~0x3;
c965db44462919f Tomer Tayar        2016-09-07  7957  =

6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7958  	if (txt_size_bytes < =
QED_RESULTS_BUF_MIN_SIZE) {
c965db44462919f Tomer Tayar        2016-09-07  7959  		DP_NOTICE(p_hwfn->cd=
ev,
c965db44462919f Tomer Tayar        2016-09-07  7960  			  "formatted size o=
f feature was too small %d. Aborting\n",
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7961  			  txt_size_bytes);
c965db44462919f Tomer Tayar        2016-09-07  7962  		return DBG_STATUS_IN=
VALID_ARGS;
c965db44462919f Tomer Tayar        2016-09-07  7963  	}
c965db44462919f Tomer Tayar        2016-09-07  7964  =

6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7965  	/* allocate temp text=
 buf */
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7966  	text_buf =3D vzalloc(=
txt_size_bytes);
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7967  	if (!text_buf) {
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7968  		DP_NOTICE(p_hwfn->cd=
ev,
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7969  			  "failed to alloca=
te text buffer. Aborting\n");
c965db44462919f Tomer Tayar        2016-09-07  7970  		return DBG_STATUS_VI=
RT_MEM_ALLOC_FAILED;
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7971  	}
c965db44462919f Tomer Tayar        2016-09-07  7972  =

c965db44462919f Tomer Tayar        2016-09-07  7973  	/* Decode feature opc=
odes to string on temp buf */
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7974  	rc =3D qed_features_l=
ookup[feature_idx].print_results(p_hwfn,
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7975  							    dbuf,
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7976  							    dwords,
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7977  							    text_buf);
c965db44462919f Tomer Tayar        2016-09-07  7978  	if (rc !=3D DBG_STATU=
S_OK) {
c965db44462919f Tomer Tayar        2016-09-07  7979  		vfree(text_buf);
c965db44462919f Tomer Tayar        2016-09-07  7980  		return rc;
c965db44462919f Tomer Tayar        2016-09-07  7981  	}
c965db44462919f Tomer Tayar        2016-09-07  7982  =

c965db44462919f Tomer Tayar        2016-09-07  7983  	/* Replace the origin=
al null character with a '\n' character.
c965db44462919f Tomer Tayar        2016-09-07  7984  	 * The bytes that wer=
e added as a result of the dword alignment are also
c965db44462919f Tomer Tayar        2016-09-07  7985  	 * padded with '\n' c=
haracters.
c965db44462919f Tomer Tayar        2016-09-07  7986  	 */
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7987  	for (i =3D null_char_=
pos; i < txt_size_bytes; i++)
c965db44462919f Tomer Tayar        2016-09-07  7988  		text_buf[i] =3D '\n';
c965db44462919f Tomer Tayar        2016-09-07  7989  =

c965db44462919f Tomer Tayar        2016-09-07  7990  	/* Dump printable fea=
ture to log */
ca352f00756e7bd Igor Russkikh      2020-05-14  7991  	if (p_hwfn->cdev->pri=
nt_dbg_data)
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7992  		qed_dbg_print_featur=
e(text_buf, txt_size_bytes);
c965db44462919f Tomer Tayar        2016-09-07  7993  =

6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7994  	/* Dump binary data a=
s is to the output file */
da3287111ab43b3 Alexander Lobakin  2020-07-06  7995  	if (p_hwfn->cdev->dbg=
_bin_dump) {
da3287111ab43b3 Alexander Lobakin  2020-07-06  7996  		vfree(text_buf);
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  7997  		return rc;
da3287111ab43b3 Alexander Lobakin  2020-07-06  7998  	}
da3287111ab43b3 Alexander Lobakin  2020-07-06  7999  =

6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  8000  	/* Free the old dump_=
buf and point the dump_buf to the newly allocated
c965db44462919f Tomer Tayar        2016-09-07  8001  	 * and formatted text=
 buffer.
c965db44462919f Tomer Tayar        2016-09-07  8002  	 */
c965db44462919f Tomer Tayar        2016-09-07  8003  	vfree(feature->dump_b=
uf);
c965db44462919f Tomer Tayar        2016-09-07  8004  	feature->dump_buf =3D=
 text_buf;
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  8005  	feature->buf_size =3D=
 txt_size_bytes;
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  8006  	feature->dumped_dword=
s =3D txt_size_bytes / 4;
6c95dd8f0aa1d98 Prabhakar Kushwaha 2021-10-04  8007  =

c965db44462919f Tomer Tayar        2016-09-07  8008  	return rc;
c965db44462919f Tomer Tayar        2016-09-07  8009  }
c965db44462919f Tomer Tayar        2016-09-07  8010  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5071213993944976795==--


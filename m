Content-Type: multipart/mixed; boundary="===============5343948368144485356=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android-3.18 396/1091] drivers/scsi/qla2xxx/tcm_qla2xxx.c:947:1: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
Date: Fri, 30 Apr 2021 08:49:50 +0800
Message-ID: <202104300838.YAzrkTvL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5343948368144485356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-3.18
head:   c7075682a9dd6d2807238e2af6c041e86d31bd20
commit: 8214bf079208b146e63cd0a3ce0ed335a87ce7b3 [396/1091] scripts/dtc: Ex=
port YYLOC global declaration
:::::: branch date: 7 days ago
:::::: commit date: 2 months ago
compiler: aarch64-linux-gcc (GCC) 5.5.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +947 drivers/scsi/qla2xxx/tcm_qla2xxx.c

75f8c1f693eefac Nicholas Bellinger 2012-05-15  939  =

75f8c1f693eefac Nicholas Bellinger 2012-05-15  940  #define QLA_TPG_ATTR(_n=
ame, _mode) \
75f8c1f693eefac Nicholas Bellinger 2012-05-15  941  	TF_TPG_ATTRIB_ATTR(tcm=
_qla2xxx, _name, _mode);
75f8c1f693eefac Nicholas Bellinger 2012-05-15  942  =

75f8c1f693eefac Nicholas Bellinger 2012-05-15  943  /*
75f8c1f693eefac Nicholas Bellinger 2012-05-15  944   * Define tcm_qla2xxx_t=
pg_attrib_s_generate_node_acls
75f8c1f693eefac Nicholas Bellinger 2012-05-15  945   */
75f8c1f693eefac Nicholas Bellinger 2012-05-15  946  DEF_QLA_TPG_ATTR_BOOL(g=
enerate_node_acls);
75f8c1f693eefac Nicholas Bellinger 2012-05-15 @947  DEF_QLA_TPG_ATTRIB(gene=
rate_node_acls);
75f8c1f693eefac Nicholas Bellinger 2012-05-15  948  QLA_TPG_ATTR(generate_n=
ode_acls, S_IRUGO | S_IWUSR);
75f8c1f693eefac Nicholas Bellinger 2012-05-15  949  =


:::::: The code at line 947 was first introduced by commit
:::::: 75f8c1f693eefacc17a65614eb4ed1ee0f84fda6 [SCSI] tcm_qla2xxx: Add >=
=3D 24xx series fabric module for target-core

:::::: TO: Nicholas Bellinger <nab@linux-iscsi.org>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5343948368144485356==--


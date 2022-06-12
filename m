Content-Type: multipart/mixed; boundary="===============0690909988773390111=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/nx/nx-common-pseries.c:1146 nxcop_get_capabilities() error: uninitialized symbol 'hv_nxc'.
Date: Sun, 12 Jun 2022 19:37:11 +0800
Message-ID: <202206121940.30TYe8Nk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0690909988773390111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Haren Myneni <haren@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0678afa6055d14799c1dc1eee47c8025eba56cab
commit: b4ba22114c78de48fda3818f569f75e97d58c719 crypto/nx: Get NX capabili=
ties for GZIP coprocessor type
date:   12 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 12 months ago
config: powerpc64-randconfig-m031-20220611 (https://download.01.org/0day-ci=
/archive/20220612/202206121940.30TYe8Nk-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/crypto/nx/nx-common-pseries.c:1146 nxcop_get_capabilities() error: =
uninitialized symbol 'hv_nxc'.

vim +/hv_nxc +1146 drivers/crypto/nx/nx-common-pseries.c

0e16aafb12046e1 drivers/crypto/nx/nx-842.c            Seth Jennings 2012-07=
-19  1092  =

b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1093  /*
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1094   * Get NX capabilities from the hypervisor.
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1095   * Only NXGZIP capabilities are provided by the hypersvisor right
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1096   * now and these values are available to user space with sysfs.
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1097   */
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1098  static void __init nxcop_get_capabilities(void)
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1099  {
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1100  	struct hv_vas_all_caps *hv_caps;
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1101  	struct hv_nx_cop_caps *hv_nxc;
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1102  	int rc;
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1103  =

b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1104  	hv_caps =3D kmalloc(sizeof(*hv_caps), GFP_KERNEL);
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1105  	if (!hv_caps)
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1106  		return;
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1107  	/*
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1108  	 * Get NX overall capabilities with feature type=3D0
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1109  	 */
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1110  	rc =3D h_query_vas_capabilities(H_QUERY_NX_CAPABILITIES, 0,
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1111  					  (u64)virt_to_phys(hv_caps));
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1112  	if (rc)
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1113  		goto out;
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1114  =

b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1115  	caps_feat =3D be64_to_cpu(hv_caps->feat_type);
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1116  	/*
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1117  	 * NX-GZIP feature available
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1118  	 */
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1119  	if (caps_feat & VAS_NX_GZIP_FEAT_BIT) {
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1120  		hv_nxc =3D kmalloc(sizeof(*hv_nxc), GFP_KERNEL);
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1121  		if (!hv_nxc)
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1122  			goto out;
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1123  		/*
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1124  		 * Get capabilities for NX-GZIP feature
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1125  		 */
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1126  		rc =3D h_query_vas_capabilities(H_QUERY_NX_CAPABILITIES,
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1127  						  VAS_NX_GZIP_FEAT,
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1128  						  (u64)virt_to_phys(hv_nxc));
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1129  	} else {
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1130  		pr_err("NX-GZIP feature is not available\n");
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1131  		rc =3D -EINVAL;
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1132  	}
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1133  =

b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1134  	if (!rc) {
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1135  		nx_cop_caps.descriptor =3D be64_to_cpu(hv_nxc->descriptor);
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1136  		nx_cop_caps.req_max_processed_len =3D
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1137  				be64_to_cpu(hv_nxc->req_max_processed_len);
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1138  		nx_cop_caps.min_compress_len =3D
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1139  				be64_to_cpu(hv_nxc->min_compress_len);
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1140  		nx_cop_caps.min_decompress_len =3D
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1141  				be64_to_cpu(hv_nxc->min_decompress_len);
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1142  	} else {
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1143  		caps_feat =3D 0;
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1144  	}
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1145  =

b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17 @1146  	kfree(hv_nxc);
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1147  out:
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1148  	kfree(hv_caps);
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1149  }
b4ba22114c78de4 drivers/crypto/nx/nx-common-pseries.c Haren Myneni  2021-06=
-17  1150  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0690909988773390111==--


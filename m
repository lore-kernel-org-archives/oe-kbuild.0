Content-Type: multipart/mixed; boundary="===============3078186860914102693=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vdpa/mlx5/net/mlx5_vnet.c:313:46: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Mon, 31 May 2021 00:23:29 +0800
Message-ID: <202105310010.x1F3Qqwx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3078186860914102693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eli Cohen <eli@mellanox.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Parav Pandit <parav@mellanox.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b90e90f40b4ff23c753126008bf4713a42353af6
commit: 1a86b377aa2147a7c866b03142e848c18e5f3cb8 vdpa/mlx5: Add VDPA driver=
 for supported mlx5 devices
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/vdpa/mlx5/net/mlx5_vnet.c:313:46: warning: Boolean result is use=
d in bitwise operation. Clarify expression with parentheses. [clarifyCondit=
ion]
        !((cqe64->op_own & MLX5_CQE_OWNER_MASK) ^ !!(n & cq->cqe)))
                                                ^

vim +313 drivers/vdpa/mlx5/net/mlx5_vnet.c

1a86b377aa2147a Eli Cohen 2020-08-04  307  =

1a86b377aa2147a Eli Cohen 2020-08-04  308  static void *get_sw_cqe(struct m=
lx5_vdpa_cq *cq, int n)
1a86b377aa2147a Eli Cohen 2020-08-04  309  {
1a86b377aa2147a Eli Cohen 2020-08-04  310  	struct mlx5_cqe64 *cqe64 =3D ge=
t_cqe(cq, n & (cq->cqe - 1));
1a86b377aa2147a Eli Cohen 2020-08-04  311  =

1a86b377aa2147a Eli Cohen 2020-08-04  312  	if (likely(get_cqe_opcode(cqe64=
) !=3D MLX5_CQE_INVALID) &&
1a86b377aa2147a Eli Cohen 2020-08-04 @313  	    !((cqe64->op_own & MLX5_CQE=
_OWNER_MASK) ^ !!(n & cq->cqe)))
1a86b377aa2147a Eli Cohen 2020-08-04  314  		return cqe64;
1a86b377aa2147a Eli Cohen 2020-08-04  315  =

1a86b377aa2147a Eli Cohen 2020-08-04  316  	return NULL;
1a86b377aa2147a Eli Cohen 2020-08-04  317  }
1a86b377aa2147a Eli Cohen 2020-08-04  318  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3078186860914102693==--


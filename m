Content-Type: multipart/mixed; boundary="===============1123407832092448503=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vdpa/mlx5/core/mr.c:46 populate_mtts() warn: should '(((1))) << (mr->log_size)' be a 64 bit type?
Date: Sun, 12 Dec 2021 01:38:28 +0800
Message-ID: <202112120123.JO8hsqOh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1123407832092448503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eli Cohen <elic@nvidia.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6f513529296fd4f696afb4354c46508abe646541
commit: 710eb8e32d04714452759f2b66884bfa7e97d495 vdpa/mlx5: Fix memory key =
MTT population
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-m031-20211211 (https://download.01.org/0day-ci/arch=
ive/20211212/202112120123.JO8hsqOh-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/vdpa/mlx5/core/mr.c:46 populate_mtts() warn: should '(((1))) << (mr=
->log_size)' be a 64 bit type?
drivers/vdpa/mlx5/core/mr.c:46 populate_mtts() warn: should '(((1))) << (mr=
->log_size)' be a 64 bit type?

Old smatch warnings:
drivers/vdpa/mlx5/core/mr.c:277 map_direct_mr() warn: missing error code 'e=
rr'

vim +46 drivers/vdpa/mlx5/core/mr.c

94abbccdf2916c Eli Cohen 2020-08-04  33  =

94abbccdf2916c Eli Cohen 2020-08-04  34  static void populate_mtts(struct m=
lx5_vdpa_direct_mr *mr, __be64 *mtt)
94abbccdf2916c Eli Cohen 2020-08-04  35  {
94abbccdf2916c Eli Cohen 2020-08-04  36  	struct scatterlist *sg;
710eb8e32d0471 Eli Cohen 2021-01-07  37  	int nsg =3D mr->nsg;
710eb8e32d0471 Eli Cohen 2021-01-07  38  	u64 dma_addr;
710eb8e32d0471 Eli Cohen 2021-01-07  39  	u64 dma_len;
710eb8e32d0471 Eli Cohen 2021-01-07  40  	int j =3D 0;
94abbccdf2916c Eli Cohen 2020-08-04  41  	int i;
94abbccdf2916c Eli Cohen 2020-08-04  42  =

710eb8e32d0471 Eli Cohen 2021-01-07  43  	for_each_sg(mr->sg_head.sgl, sg, =
mr->nent, i) {
710eb8e32d0471 Eli Cohen 2021-01-07  44  		for (dma_addr =3D sg_dma_address=
(sg), dma_len =3D sg_dma_len(sg);
710eb8e32d0471 Eli Cohen 2021-01-07  45  		     nsg && dma_len;
710eb8e32d0471 Eli Cohen 2021-01-07 @46  		     nsg--, dma_addr +=3D BIT(mr=
->log_size), dma_len -=3D BIT(mr->log_size))
710eb8e32d0471 Eli Cohen 2021-01-07  47  			mtt[j++] =3D cpu_to_be64(dma_ad=
dr);
710eb8e32d0471 Eli Cohen 2021-01-07  48  	}
94abbccdf2916c Eli Cohen 2020-08-04  49  }
94abbccdf2916c Eli Cohen 2020-08-04  50  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1123407832092448503==--


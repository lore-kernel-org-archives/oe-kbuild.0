Content-Type: multipart/mixed; boundary="===============0533399305684194751=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9659/9759] drivers/nvme/host/ioctl.c:693 nvme_ns_head_chr_uring_cmd() error: uninitialized symbol 'ret'.
Date: Sat, 07 May 2022 01:21:29 +0800
Message-ID: <202205070110.NkXS8Cln-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0533399305684194751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kanchan Joshi <joshi.k@samsung.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Anuj Gupta <anuj20.g@samsung.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: 86116c2f6fee81a0be72a71cc2f1f7c087df8efa [9659/9759] nvme: wire-up =
uring-cmd support for io-passthru on char-device.
:::::: branch date: 9 hours ago
:::::: commit date: 16 hours ago
config: microblaze-randconfig-m031-20220505 (https://download.01.org/0day-c=
i/archive/20220507/202205070110.NkXS8Cln-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/nvme/host/ioctl.c:693 nvme_ns_head_chr_uring_cmd() error: uninitial=
ized symbol 'ret'.

Old smatch warnings:
drivers/nvme/host/ioctl.c:203 nvme_alloc_user_request() warn: variable dere=
ferenced before check 'bio' (see line 188)
drivers/nvme/host/ioctl.c:366 nvme_user_cmd() error: uninitialized symbol '=
result'.

vim +/ret +693 drivers/nvme/host/ioctl.c

86116c2f6fee81 Kanchan Joshi     2022-05-05  680  =

86116c2f6fee81 Kanchan Joshi     2022-05-05  681  int nvme_ns_head_chr_urin=
g_cmd(struct io_uring_cmd *ioucmd,
86116c2f6fee81 Kanchan Joshi     2022-05-05  682  		unsigned int issue_flag=
s)
86116c2f6fee81 Kanchan Joshi     2022-05-05  683  {
86116c2f6fee81 Kanchan Joshi     2022-05-05  684  	struct cdev *cdev =3D fi=
le_inode(ioucmd->file)->i_cdev;
86116c2f6fee81 Kanchan Joshi     2022-05-05  685  	struct nvme_ns_head *hea=
d =3D container_of(cdev, struct nvme_ns_head, cdev);
86116c2f6fee81 Kanchan Joshi     2022-05-05  686  	int srcu_idx =3D srcu_re=
ad_lock(&head->srcu);
86116c2f6fee81 Kanchan Joshi     2022-05-05  687  	struct nvme_ns *ns =3D n=
vme_find_path(head);
86116c2f6fee81 Kanchan Joshi     2022-05-05  688  	int ret;
86116c2f6fee81 Kanchan Joshi     2022-05-05  689  =

86116c2f6fee81 Kanchan Joshi     2022-05-05  690  	if (ns)
86116c2f6fee81 Kanchan Joshi     2022-05-05  691  		ret =3D nvme_ns_uring_c=
md(ns, ioucmd, issue_flags);
86116c2f6fee81 Kanchan Joshi     2022-05-05  692  	srcu_read_unlock(&head->=
srcu, srcu_idx);
86116c2f6fee81 Kanchan Joshi     2022-05-05 @693  	return ret;
86116c2f6fee81 Kanchan Joshi     2022-05-05  694  }
2405252a680e21 Christoph Hellwig 2021-04-10  695  #endif /* CONFIG_NVME_MUL=
TIPATH */
2405252a680e21 Christoph Hellwig 2021-04-10  696  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0533399305684194751==--


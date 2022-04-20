Content-Type: multipart/mixed; boundary="===============6306384684591719582=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/3] shmem: Introduce /sys/fs/tmpfs support
Date: Wed, 20 Apr 2022 08:10:56 +0800
Message-ID: <202204200819.72S8HjcF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6306384684591719582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220418213713.273050-3-krisman@collabora.com>
References: <20220418213713.273050-3-krisman@collabora.com>
TO: Gabriel Krisman Bertazi <krisman@collabora.com>
TO: hughd(a)google.com
TO: akpm(a)linux-foundation.org
TO: amir73il(a)gmail.com
CC: viro(a)zeniv.linux.org.uk
CC: Gabriel Krisman Bertazi <krisman@collabora.com>
CC: kernel(a)collabora.com
CC: Khazhismel Kumykov <khazhy@google.com>
CC: Linux MM <linux-mm@kvack.org>
CC: "linux-fsdevel" <linux-fsdevel@vger.kernel.org>

Hi Gabriel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.18-rc3 next-20220419]
[cannot apply to hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bert=
azi/shmem-Allow-userspace-monitoring-of-tmpfs-for-lack-of-space/20220419-05=
4011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
b2d229d4ddb17db541098b83524d901257e93845
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: ia64-randconfig-m031-20220418 (https://download.01.org/0day-ci/arch=
ive/20220420/202204200819.72S8HjcF-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/shmem.c:3965 shmem_init() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +3965 mm/shmem.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  3927  =

41ffe5d5ceef7f Hugh Dickins            2011-08-03  3928  int __init shmem_i=
nit(void)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3929  {
^1da177e4c3f41 Linus Torvalds          2005-04-16  3930  	int error;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3931  =

9a8ec03ed022b7 weiping zhang           2017-11-15  3932  	shmem_init_inodec=
ache();
^1da177e4c3f41 Linus Torvalds          2005-04-16  3933  =

41ffe5d5ceef7f Hugh Dickins            2011-08-03  3934  	error =3D registe=
r_filesystem(&shmem_fs_type);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3935  	if (error) {
1170532bb49f94 Joe Perches             2016-03-17  3936  		pr_err("Could no=
t register tmpfs\n");
^1da177e4c3f41 Linus Torvalds          2005-04-16  3937  		goto out2;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3938  	}
95dc112a5770dc Greg Kroah-Hartman      2005-06-20  3939  =

e43933b9793ad3 Gabriel Krisman Bertazi 2022-04-18  3940  	shmem_root =3D ko=
bject_create_and_add("tmpfs", fs_kobj);
e43933b9793ad3 Gabriel Krisman Bertazi 2022-04-18  3941  	if (!shmem_root)
e43933b9793ad3 Gabriel Krisman Bertazi 2022-04-18  3942  		goto out1;
e43933b9793ad3 Gabriel Krisman Bertazi 2022-04-18  3943  =

ca4e05195dbc25 Al Viro                 2013-08-31  3944  	shm_mnt =3D kern_=
mount(&shmem_fs_type);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3945  	if (IS_ERR(shm_mn=
t)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  3946  		error =3D PTR_ER=
R(shm_mnt);
1170532bb49f94 Joe Perches             2016-03-17  3947  		pr_err("Could no=
t kern_mount tmpfs\n");
e43933b9793ad3 Gabriel Krisman Bertazi 2022-04-18  3948  		goto put_kobj;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3949  	}
5a6e75f8110c97 Kirill A. Shutemov      2016-07-26  3950  =

396bcc5299c281 Matthew Wilcox (Oracle  2020-04-06  3951) #ifdef CONFIG_TRAN=
SPARENT_HUGEPAGE
435c0b87d661da Kirill A. Shutemov      2017-08-25  3952  	if (has_transpare=
nt_hugepage() && shmem_huge > SHMEM_HUGE_DENY)
5a6e75f8110c97 Kirill A. Shutemov      2016-07-26  3953  		SHMEM_SB(shm_mnt=
->mnt_sb)->huge =3D shmem_huge;
5a6e75f8110c97 Kirill A. Shutemov      2016-07-26  3954  	else
5e6e5a12a44ca5 Hugh Dickins            2021-09-02  3955  		shmem_huge =3D S=
HMEM_HUGE_NEVER; /* just in case it was patched */
5a6e75f8110c97 Kirill A. Shutemov      2016-07-26  3956  #endif
^1da177e4c3f41 Linus Torvalds          2005-04-16  3957  	return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3958  =

e43933b9793ad3 Gabriel Krisman Bertazi 2022-04-18  3959  put_kobj:
e43933b9793ad3 Gabriel Krisman Bertazi 2022-04-18  3960  	kobject_put(shmem=
_root);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3961  out1:
41ffe5d5ceef7f Hugh Dickins            2011-08-03  3962  	unregister_filesy=
stem(&shmem_fs_type);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3963  out2:
41ffe5d5ceef7f Hugh Dickins            2011-08-03  3964  	shmem_destroy_ino=
decache();
^1da177e4c3f41 Linus Torvalds          2005-04-16 @3965  	shm_mnt =3D ERR_P=
TR(error);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3966  	return error;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3967  }
853ac43ab194f5 Matt Mackall            2009-01-06  3968  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6306384684591719582==--


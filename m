Content-Type: multipart/mixed; boundary="===============7957628642849199960=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:for-next-20220401 96/102] fs/btrfs/sysfs.c:830 btrfs_force_chunk_alloc_store() warn: passing zero to 'PTR_ERR'
Date: Sun, 03 Apr 2022 08:32:53 +0800
Message-ID: <202204030841.qWK5rMDU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7957628642849199960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Stefan Roesch <shr@fb.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git for-next-20220401
head:   0c593f04d2f520a720c5c618ba9fe0355d08bba8
commit: 6e115adef2b6a9b9a7cc25414e1b8f4414e02044 [96/102] btrfs: add force_=
chunk_alloc sysfs entry to force allocation
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: nios2-randconfig-m031-20220403 (https://download.01.org/0day-ci/arc=
hive/20220403/202204030841.qWK5rMDU-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/sysfs.c:830 btrfs_force_chunk_alloc_store() warn: passing zero to =
'PTR_ERR'

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninit=
ialized symbol 'sp'.

vim +/PTR_ERR +830 fs/btrfs/sysfs.c

d90abd991ad41f Stefan Roesch 2021-12-03  792  =

6e115adef2b6a9 Stefan Roesch 2021-12-03  793  #ifdef CONFIG_BTRFS_DEBUG
6e115adef2b6a9 Stefan Roesch 2021-12-03  794  /*
6e115adef2b6a9 Stefan Roesch 2021-12-03  795   * Request chunk allocation w=
ith current chunk size.
6e115adef2b6a9 Stefan Roesch 2021-12-03  796   */
6e115adef2b6a9 Stefan Roesch 2021-12-03  797  static ssize_t btrfs_force_ch=
unk_alloc_store(struct kobject *kobj,
6e115adef2b6a9 Stefan Roesch 2021-12-03  798  					     struct kobj_attribu=
te *a,
6e115adef2b6a9 Stefan Roesch 2021-12-03  799  					     const char *buf, si=
ze_t len)
6e115adef2b6a9 Stefan Roesch 2021-12-03  800  {
6e115adef2b6a9 Stefan Roesch 2021-12-03  801  	struct btrfs_space_info *spa=
ce_info =3D to_space_info(kobj);
6e115adef2b6a9 Stefan Roesch 2021-12-03  802  	struct btrfs_fs_info *fs_inf=
o =3D to_fs_info(get_btrfs_kobj(kobj));
6e115adef2b6a9 Stefan Roesch 2021-12-03  803  	struct btrfs_trans_handle *t=
rans;
6e115adef2b6a9 Stefan Roesch 2021-12-03  804  	unsigned long val;
6e115adef2b6a9 Stefan Roesch 2021-12-03  805  	int ret;
6e115adef2b6a9 Stefan Roesch 2021-12-03  806  =

6e115adef2b6a9 Stefan Roesch 2021-12-03  807  	if (!fs_info) {
6e115adef2b6a9 Stefan Roesch 2021-12-03  808  		pr_err("couldn't get fs_inf=
o\n");
6e115adef2b6a9 Stefan Roesch 2021-12-03  809  		return -EPERM;
6e115adef2b6a9 Stefan Roesch 2021-12-03  810  	}
6e115adef2b6a9 Stefan Roesch 2021-12-03  811  =

6e115adef2b6a9 Stefan Roesch 2021-12-03  812  	if (!capable(CAP_SYS_ADMIN))
6e115adef2b6a9 Stefan Roesch 2021-12-03  813  		return -EPERM;
6e115adef2b6a9 Stefan Roesch 2021-12-03  814  =

6e115adef2b6a9 Stefan Roesch 2021-12-03  815  	if (sb_rdonly(fs_info->sb))
6e115adef2b6a9 Stefan Roesch 2021-12-03  816  		return -EROFS;
6e115adef2b6a9 Stefan Roesch 2021-12-03  817  =

6e115adef2b6a9 Stefan Roesch 2021-12-03  818  	ret =3D kstrtoul(buf, 10, &v=
al);
6e115adef2b6a9 Stefan Roesch 2021-12-03  819  	if (ret)
6e115adef2b6a9 Stefan Roesch 2021-12-03  820  		return ret;
6e115adef2b6a9 Stefan Roesch 2021-12-03  821  =

6e115adef2b6a9 Stefan Roesch 2021-12-03  822  	if (val =3D=3D 0)
6e115adef2b6a9 Stefan Roesch 2021-12-03  823  		return -EINVAL;
6e115adef2b6a9 Stefan Roesch 2021-12-03  824  =

6e115adef2b6a9 Stefan Roesch 2021-12-03  825  	/*
6e115adef2b6a9 Stefan Roesch 2021-12-03  826  	 * Allocate new chunk.
6e115adef2b6a9 Stefan Roesch 2021-12-03  827  	 */
6e115adef2b6a9 Stefan Roesch 2021-12-03  828  	trans =3D btrfs_start_transa=
ction(fs_info->tree_root, 0);
6e115adef2b6a9 Stefan Roesch 2021-12-03  829  	if (!trans)
6e115adef2b6a9 Stefan Roesch 2021-12-03 @830  		return PTR_ERR(trans);
6e115adef2b6a9 Stefan Roesch 2021-12-03  831  	ret =3D btrfs_force_chunk_al=
loc(trans, space_info->flags);
6e115adef2b6a9 Stefan Roesch 2021-12-03  832  	btrfs_end_transaction(trans);
6e115adef2b6a9 Stefan Roesch 2021-12-03  833  =

6e115adef2b6a9 Stefan Roesch 2021-12-03  834  	if (ret =3D=3D 1)
6e115adef2b6a9 Stefan Roesch 2021-12-03  835  		return len;
6e115adef2b6a9 Stefan Roesch 2021-12-03  836  =

6e115adef2b6a9 Stefan Roesch 2021-12-03  837  	return -ENOSPC;
6e115adef2b6a9 Stefan Roesch 2021-12-03  838  }
6e115adef2b6a9 Stefan Roesch 2021-12-03  839  #endif
6e115adef2b6a9 Stefan Roesch 2021-12-03  840  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7957628642849199960==--


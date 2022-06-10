Content-Type: multipart/mixed; boundary="===============2163199936335693864=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [fdmanana:misc-next 36/71] fs/btrfs/sysfs.c:811 btrfs_force_chunk_alloc_store() warn: passing zero to 'PTR_ERR'
Date: Fri, 10 Jun 2022 11:35:58 +0800
Message-ID: <202206101159.fXYW8bYv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2163199936335693864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Stefan Roesch <shr@fb.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux.git =
misc-next
head:   e2a46f3f73fd5aac0241242d535905286a947113
commit: 46e1bce0ac340396474e5f604c2acb6644175854 [36/71] btrfs: sysfs: add =
force_chunk_alloc trigger to force allocation
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: m68k-randconfig-m031-20220608 (https://download.01.org/0day-ci/arch=
ive/20220610/202206101159.fXYW8bYv-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/sysfs.c:811 btrfs_force_chunk_alloc_store() warn: passing zero to =
'PTR_ERR'

vim +/PTR_ERR +811 fs/btrfs/sysfs.c

071124d221c5fb Stefan Roesch 2022-02-08  777  =

46e1bce0ac3403 Stefan Roesch 2022-02-08  778  #ifdef CONFIG_BTRFS_DEBUG
46e1bce0ac3403 Stefan Roesch 2022-02-08  779  /*
46e1bce0ac3403 Stefan Roesch 2022-02-08  780   * Request chunk allocation w=
ith current chunk size.
46e1bce0ac3403 Stefan Roesch 2022-02-08  781   */
46e1bce0ac3403 Stefan Roesch 2022-02-08  782  static ssize_t btrfs_force_ch=
unk_alloc_store(struct kobject *kobj,
46e1bce0ac3403 Stefan Roesch 2022-02-08  783  					     struct kobj_attribu=
te *a,
46e1bce0ac3403 Stefan Roesch 2022-02-08  784  					     const char *buf, si=
ze_t len)
46e1bce0ac3403 Stefan Roesch 2022-02-08  785  {
46e1bce0ac3403 Stefan Roesch 2022-02-08  786  	struct btrfs_space_info *spa=
ce_info =3D to_space_info(kobj);
46e1bce0ac3403 Stefan Roesch 2022-02-08  787  	struct btrfs_fs_info *fs_inf=
o =3D to_fs_info(get_btrfs_kobj(kobj));
46e1bce0ac3403 Stefan Roesch 2022-02-08  788  	struct btrfs_trans_handle *t=
rans;
46e1bce0ac3403 Stefan Roesch 2022-02-08  789  	bool val;
46e1bce0ac3403 Stefan Roesch 2022-02-08  790  	int ret;
46e1bce0ac3403 Stefan Roesch 2022-02-08  791  =

46e1bce0ac3403 Stefan Roesch 2022-02-08  792  	if (!capable(CAP_SYS_ADMIN))
46e1bce0ac3403 Stefan Roesch 2022-02-08  793  		return -EPERM;
46e1bce0ac3403 Stefan Roesch 2022-02-08  794  =

46e1bce0ac3403 Stefan Roesch 2022-02-08  795  	if (sb_rdonly(fs_info->sb))
46e1bce0ac3403 Stefan Roesch 2022-02-08  796  		return -EROFS;
46e1bce0ac3403 Stefan Roesch 2022-02-08  797  =

46e1bce0ac3403 Stefan Roesch 2022-02-08  798  	ret =3D kstrtobool(buf, &val=
);
46e1bce0ac3403 Stefan Roesch 2022-02-08  799  	if (ret)
46e1bce0ac3403 Stefan Roesch 2022-02-08  800  		return ret;
46e1bce0ac3403 Stefan Roesch 2022-02-08  801  =

46e1bce0ac3403 Stefan Roesch 2022-02-08  802  	if (!val)
46e1bce0ac3403 Stefan Roesch 2022-02-08  803  		return -EINVAL;
46e1bce0ac3403 Stefan Roesch 2022-02-08  804  =

46e1bce0ac3403 Stefan Roesch 2022-02-08  805  	/*
46e1bce0ac3403 Stefan Roesch 2022-02-08  806  	 * This is unsafe to be call=
ed from sysfs context and may cause
46e1bce0ac3403 Stefan Roesch 2022-02-08  807  	 * unexpected problems.
46e1bce0ac3403 Stefan Roesch 2022-02-08  808  	 */
46e1bce0ac3403 Stefan Roesch 2022-02-08  809  	trans =3D btrfs_start_transa=
ction(fs_info->tree_root, 0);
46e1bce0ac3403 Stefan Roesch 2022-02-08  810  	if (!trans)
46e1bce0ac3403 Stefan Roesch 2022-02-08 @811  		return PTR_ERR(trans);
46e1bce0ac3403 Stefan Roesch 2022-02-08  812  	ret =3D btrfs_force_chunk_al=
loc(trans, space_info->flags);
46e1bce0ac3403 Stefan Roesch 2022-02-08  813  	btrfs_end_transaction(trans);
46e1bce0ac3403 Stefan Roesch 2022-02-08  814  =

46e1bce0ac3403 Stefan Roesch 2022-02-08  815  	if (ret =3D=3D 1)
46e1bce0ac3403 Stefan Roesch 2022-02-08  816  		return len;
46e1bce0ac3403 Stefan Roesch 2022-02-08  817  =

46e1bce0ac3403 Stefan Roesch 2022-02-08  818  	return -ENOSPC;
46e1bce0ac3403 Stefan Roesch 2022-02-08  819  }
46e1bce0ac3403 Stefan Roesch 2022-02-08  820  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2163199936335693864==--


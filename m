Content-Type: multipart/mixed; boundary="===============1403828898825380561=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:widen-efi-and-bui-formats 112/207] fs/remap_range.c:839:9: warning: Identical condition 'ret', second condition is always false
Date: Sun, 11 Oct 2020 09:18:38 +0800
Message-ID: <202010110934.ooV9KMXt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1403828898825380561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t widen-efi-and-bui-formats
head:   ef64906c6424d07d3d85caa2094a7d138b6ee345
commit: 2c86a87fbf03aede5118351f1b41da865b0f2555 [112/207] vfs: introduce n=
ew file extent swap ioctl
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/remap_range.c:839:9: warning: Identical condition 'ret', second condi=
tion is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   fs/remap_range.c:834:6: note: first condition
    if (ret)
        ^
   fs/remap_range.c:839:9: note: second condition
    return ret;
           ^

vim +/ret +839 fs/remap_range.c

2c86a87fbf03ae Darrick J. Wong 2020-06-25  797  =

2c86a87fbf03ae Darrick J. Wong 2020-06-25  798  int do_swap_file_range(stru=
ct file *file1, struct file *file2,
2c86a87fbf03ae Darrick J. Wong 2020-06-25  799  		       struct file_swap_r=
ange *fsr)
2c86a87fbf03ae Darrick J. Wong 2020-06-25  800  {
2c86a87fbf03ae Darrick J. Wong 2020-06-25  801  	int ret;
2c86a87fbf03ae Darrick J. Wong 2020-06-25  802  =

2c86a87fbf03ae Darrick J. Wong 2020-06-25  803  	if ((fsr->flags & ~FILE_SW=
AP_RANGE_ALL_FLAGS) ||
2c86a87fbf03ae Darrick J. Wong 2020-06-25  804  	    memchr_inv(&fsr->pad, =
0, sizeof(fsr->pad)))
2c86a87fbf03ae Darrick J. Wong 2020-06-25  805  		return -EINVAL;
2c86a87fbf03ae Darrick J. Wong 2020-06-25  806  =

2c86a87fbf03ae Darrick J. Wong 2020-06-25  807  	if ((fsr->flags & FILE_SWA=
P_RANGE_FULL_FILES) &&
2c86a87fbf03ae Darrick J. Wong 2020-06-25  808  	    (fsr->flags & FILE_SWA=
P_RANGE_TO_EOF))
2c86a87fbf03ae Darrick J. Wong 2020-06-25  809  		return -EINVAL;
2c86a87fbf03ae Darrick J. Wong 2020-06-25  810  =

2c86a87fbf03ae Darrick J. Wong 2020-06-25  811  	/*
2c86a87fbf03ae Darrick J. Wong 2020-06-25  812  	 * FISWAPRANGE ioctl enfor=
ces that src and dest files are on the same
2c86a87fbf03ae Darrick J. Wong 2020-06-25  813  	 * mount. Practically, the=
y only need to be on the same file system.
2c86a87fbf03ae Darrick J. Wong 2020-06-25  814  	 */
2c86a87fbf03ae Darrick J. Wong 2020-06-25  815  	if (file_inode(file1)->i_s=
b !=3D file_inode(file2)->i_sb)
2c86a87fbf03ae Darrick J. Wong 2020-06-25  816  		return -EXDEV;
2c86a87fbf03ae Darrick J. Wong 2020-06-25  817  =

2c86a87fbf03ae Darrick J. Wong 2020-06-25  818  	ret =3D generic_file_rw_ch=
ecks(file1, file2);
2c86a87fbf03ae Darrick J. Wong 2020-06-25  819  	if (ret < 0)
2c86a87fbf03ae Darrick J. Wong 2020-06-25  820  		return ret;
2c86a87fbf03ae Darrick J. Wong 2020-06-25  821  =

2c86a87fbf03ae Darrick J. Wong 2020-06-25  822  	if (!file1->f_op->swap_fil=
e_range)
2c86a87fbf03ae Darrick J. Wong 2020-06-25  823  		return -EOPNOTSUPP;
2c86a87fbf03ae Darrick J. Wong 2020-06-25  824  =

2c86a87fbf03ae Darrick J. Wong 2020-06-25  825  	ret =3D swap_range_verify_=
area(file1, fsr->file1_offset, fsr);
2c86a87fbf03ae Darrick J. Wong 2020-06-25  826  	if (ret)
2c86a87fbf03ae Darrick J. Wong 2020-06-25  827  		return ret;
2c86a87fbf03ae Darrick J. Wong 2020-06-25  828  =

2c86a87fbf03ae Darrick J. Wong 2020-06-25  829  	ret =3D swap_range_verify_=
area(file2, fsr->file2_offset, fsr);
2c86a87fbf03ae Darrick J. Wong 2020-06-25  830  	if (ret)
2c86a87fbf03ae Darrick J. Wong 2020-06-25  831  		return ret;
2c86a87fbf03ae Darrick J. Wong 2020-06-25  832  =

2c86a87fbf03ae Darrick J. Wong 2020-06-25  833  	ret =3D file2->f_op->swap_=
file_range(file1, file2, fsr);
2c86a87fbf03ae Darrick J. Wong 2020-06-25  834  	if (ret)
2c86a87fbf03ae Darrick J. Wong 2020-06-25  835  		return ret;
2c86a87fbf03ae Darrick J. Wong 2020-06-25  836  =

2c86a87fbf03ae Darrick J. Wong 2020-06-25  837  	fsnotify_modify(file1);
2c86a87fbf03ae Darrick J. Wong 2020-06-25  838  	fsnotify_modify(file2);
2c86a87fbf03ae Darrick J. Wong 2020-06-25 @839  	return ret;
2c86a87fbf03ae Darrick J. Wong 2020-06-25  840  }
2c86a87fbf03ae Darrick J. Wong 2020-06-25  841  EXPORT_SYMBOL(do_swap_file_=
range);
2c86a87fbf03ae Darrick J. Wong 2020-06-25  842  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1403828898825380561==--


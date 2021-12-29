Content-Type: multipart/mixed; boundary="===============1114074602870263509=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/f2fs/compress.c:347:3: warning: Value stored to 'level' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 29 Dec 2021 09:21:13 +0800
Message-ID: <202112290901.qpqxp7wv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1114074602870263509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nick Terrell <terrelln@fb.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ecf71de775a049cbfa6298deceb8ba2083331171
commit: cf30f6a5f0c60ec98a637b836bef6915f602c6ab lib: zstd: Add kernel-spec=
ific API
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-c001-20211228 (https://download.01.org/0day-ci/arch=
ive/20211229/202112290901.qpqxp7wv-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af=
744543433ac75b232eb7dfdaef7efd4d7a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcf30f6a5f0c60ec98a637b836bef6915f602c6ab
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cf30f6a5f0c60ec98a637b836bef6915f602c6ab
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/f2fs/compress.c:1145:9: note: Calling 'prepare_compress_overwrite'
           return prepare_compress_overwrite(&cc, pagep, index, fsdata);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:1059:6: note: Assuming 'ret' is > 0
           if (ret <=3D 0)
               ^~~~~~~~
   fs/f2fs/compress.c:1059:2: note: Taking false branch
           if (ret <=3D 0)
           ^
   fs/f2fs/compress.c:1062:8: note: Calling 'f2fs_init_compress_ctx'
           ret =3D f2fs_init_compress_ctx(cc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:144:10: note: Field 'rpages' is null
           if (cc->rpages)
                   ^
   fs/f2fs/compress.c:144:2: note: Taking false branch
           if (cc->rpages)
           ^
   fs/f2fs/compress.c:147:15: note: Calling 'page_array_alloc'
           cc->rpages =3D page_array_alloc(cc->inode, cc->cluster_size);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:31:13: note: Assuming 'size' is > field 'page_array_s=
lab_size'
           if (likely(size <=3D sbi->page_array_slab_size))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/f2fs/compress.c:31:2: note: Taking false branch
           if (likely(size <=3D sbi->page_array_slab_size))
           ^
   fs/f2fs/compress.c:34:9: note: Calling 'f2fs_kzalloc'
           return f2fs_kzalloc(sbi, size, GFP_NOFS);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3191:9: note: Calling 'f2fs_kmalloc'
           return f2fs_kmalloc(sbi, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3180:6: note: Assuming the condition is false
           if (time_to_inject(sbi, FAULT_KMALLOC)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3180:2: note: Taking false branch
           if (time_to_inject(sbi, FAULT_KMALLOC)) {
           ^
   fs/f2fs/f2fs.h:3185:9: note: Storing uninitialized value
           return kmalloc(size, flags);
                  ^~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3191:9: note: Returning from 'f2fs_kmalloc'
           return f2fs_kmalloc(sbi, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:34:9: note: Returning from 'f2fs_kzalloc'
           return f2fs_kzalloc(sbi, size, GFP_NOFS);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:147:15: note: Returning from 'page_array_alloc'
           cc->rpages =3D page_array_alloc(cc->inode, cc->cluster_size);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:148:9: note: Assuming field 'rpages' is non-null
           return cc->rpages ? 0 : -ENOMEM;
                  ^~~~~~~~~~
   fs/f2fs/compress.c:148:9: note: '?' condition is true
   fs/f2fs/compress.c:1062:8: note: Returning from 'f2fs_init_compress_ctx'
           ret =3D f2fs_init_compress_ctx(cc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:1063:6: note: 'ret' is 0
           if (ret)
               ^~~
   fs/f2fs/compress.c:1063:2: note: Taking false branch
           if (ret)
           ^
   fs/f2fs/compress.c:1067:14: note: 'i' is < field 'cluster_size'
           for (i =3D 0; i < cc->cluster_size; i++) {
                       ^
   fs/f2fs/compress.c:1067:2: note: Loop condition is true.  Entering loop =
body
           for (i =3D 0; i < cc->cluster_size; i++) {
           ^
   fs/f2fs/compress.c:1070:7: note: Assuming 'page' is null
                   if (!page) {
                       ^~~~~
   fs/f2fs/compress.c:1070:3: note: Taking true branch
                   if (!page) {
                   ^
   fs/f2fs/compress.c:1072:4: note: Control jumps to line 1126
                           goto unlock_pages;
                           ^
   fs/f2fs/compress.c:1126:2: note: Calling 'f2fs_put_rpages'
           f2fs_put_rpages(cc);
           ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:115:2: note: Calling 'f2fs_drop_rpages'
           f2fs_drop_rpages(cc, cc->cluster_size, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:103:7: note: The value 0 is assigned to 'i'
           for (i =3D 0; i < len; i++) {
                ^~~~~
   fs/f2fs/compress.c:103:14: note: 'i' is < 'len'
           for (i =3D 0; i < len; i++) {
                       ^
   fs/f2fs/compress.c:103:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0; i < len; i++) {
           ^
   fs/f2fs/compress.c:104:7: note: Branch condition evaluates to a garbage =
value
                   if (!cc->rpages[i])
                       ^~~~~~~~~~~~~~
>> fs/f2fs/compress.c:347:3: warning: Value stored to 'level' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   level =3D F2FS_ZSTD_DEFAULT_CLEVEL;
                   ^
   fs/f2fs/compress.c:347:3: note: Value stored to 'level' is never read
   fs/f2fs/compress.c:1099:3: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
                   f2fs_bug_on(sbi, cc->rpages[i]);
                   ^
   fs/f2fs/f2fs.h:36:7: note: expanded from macro 'f2fs_bug_on'
                   if (WARN_ON(condition))                                 \
                       ^
   include/asm-generic/bug.h:121:2: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
           ^
   fs/f2fs/compress.c:1179:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   fs/f2fs/compress.c:1179:2: note: Taking false branch
           if (err < 0)
           ^
   fs/f2fs/compress.c:1183:7: note: 'err' is not equal to 0
           if (!err)
                ^~~
   fs/f2fs/compress.c:1183:2: note: Taking false branch
           if (!err)
           ^
   fs/f2fs/compress.c:1187:8: note: Calling 'f2fs_prepare_compress_overwrit=
e'
           err =3D f2fs_prepare_compress_overwrite(inode, &pagep,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:1145:9: note: Calling 'prepare_compress_overwrite'
           return prepare_compress_overwrite(&cc, pagep, index, fsdata);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:1054:22: note: Calling 'start_idx_of_cluster'
           pgoff_t start_idx =3D start_idx_of_cluster(cc);
                               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:72:2: note: Returning without writing to 'cc->rpages'=
, which participates in a condition later
           return cc->cluster_idx << cc->log_cluster_size;
           ^
   fs/f2fs/compress.c:1054:22: note: Returning from 'start_idx_of_cluster'
           pgoff_t start_idx =3D start_idx_of_cluster(cc);
                               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:1059:6: note: Assuming 'ret' is > 0
           if (ret <=3D 0)
               ^~~~~~~~
   fs/f2fs/compress.c:1059:2: note: Taking false branch
           if (ret <=3D 0)
           ^
   fs/f2fs/compress.c:1062:8: note: Calling 'f2fs_init_compress_ctx'
           ret =3D f2fs_init_compress_ctx(cc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:144:10: note: Field 'rpages' is null
           if (cc->rpages)
                   ^
   fs/f2fs/compress.c:144:2: note: Taking false branch
           if (cc->rpages)
           ^
   fs/f2fs/compress.c:147:15: note: Calling 'page_array_alloc'
           cc->rpages =3D page_array_alloc(cc->inode, cc->cluster_size);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:31:13: note: Assuming 'size' is > field 'page_array_s=
lab_size'
           if (likely(size <=3D sbi->page_array_slab_size))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/f2fs/compress.c:31:2: note: Taking false branch
           if (likely(size <=3D sbi->page_array_slab_size))
           ^
   fs/f2fs/compress.c:34:9: note: Calling 'f2fs_kzalloc'
           return f2fs_kzalloc(sbi, size, GFP_NOFS);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3191:9: note: Calling 'f2fs_kmalloc'
           return f2fs_kmalloc(sbi, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3180:6: note: Assuming the condition is false
           if (time_to_inject(sbi, FAULT_KMALLOC)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3180:2: note: Taking false branch
           if (time_to_inject(sbi, FAULT_KMALLOC)) {
           ^
   fs/f2fs/f2fs.h:3185:9: note: Storing uninitialized value
           return kmalloc(size, flags);
                  ^~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3191:9: note: Returning from 'f2fs_kmalloc'
           return f2fs_kmalloc(sbi, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:34:9: note: Returning from 'f2fs_kzalloc'
           return f2fs_kzalloc(sbi, size, GFP_NOFS);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:147:15: note: Returning from 'page_array_alloc'
           cc->rpages =3D page_array_alloc(cc->inode, cc->cluster_size);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:148:9: note: Assuming field 'rpages' is non-null
           return cc->rpages ? 0 : -ENOMEM;
                  ^~~~~~~~~~
   fs/f2fs/compress.c:148:9: note: '?' condition is true
   fs/f2fs/compress.c:148:2: note: Returning zero, which participates in a =
condition later
           return cc->rpages ? 0 : -ENOMEM;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:1062:8: note: Returning from 'f2fs_init_compress_ctx'
           ret =3D f2fs_init_compress_ctx(cc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/level +347 fs/f2fs/compress.c

50cfa66f0de02e Chao Yu      2020-03-03  336  =

50cfa66f0de02e Chao Yu      2020-03-03  337  static int zstd_init_compress_=
ctx(struct compress_ctx *cc)
50cfa66f0de02e Chao Yu      2020-03-03  338  {
cf30f6a5f0c60e Nick Terrell 2020-09-11  339  	zstd_parameters params;
cf30f6a5f0c60e Nick Terrell 2020-09-11  340  	zstd_cstream *stream;
50cfa66f0de02e Chao Yu      2020-03-03  341  	void *workspace;
50cfa66f0de02e Chao Yu      2020-03-03  342  	unsigned int workspace_size;
3fde13f817e23f Chao Yu      2021-01-22  343  	unsigned char level =3D F2FS_=
I(cc->inode)->i_compress_flag >>
3fde13f817e23f Chao Yu      2021-01-22  344  						COMPRESS_LEVEL_OFFSET;
3fde13f817e23f Chao Yu      2021-01-22  345  =

3fde13f817e23f Chao Yu      2021-01-22  346  	if (!level)
3fde13f817e23f Chao Yu      2021-01-22 @347  		level =3D F2FS_ZSTD_DEFAULT_=
CLEVEL;
50cfa66f0de02e Chao Yu      2020-03-03  348  =

cf30f6a5f0c60e Nick Terrell 2020-09-11  349  	params =3D zstd_get_params(F2=
FS_ZSTD_DEFAULT_CLEVEL, cc->rlen);
cf30f6a5f0c60e Nick Terrell 2020-09-11  350  	workspace_size =3D zstd_cstre=
am_workspace_bound(&params.cParams);
50cfa66f0de02e Chao Yu      2020-03-03  351  =

50cfa66f0de02e Chao Yu      2020-03-03  352  	workspace =3D f2fs_kvmalloc(F=
2FS_I_SB(cc->inode),
50cfa66f0de02e Chao Yu      2020-03-03  353  					workspace_size, GFP_NOFS);
50cfa66f0de02e Chao Yu      2020-03-03  354  	if (!workspace)
50cfa66f0de02e Chao Yu      2020-03-03  355  		return -ENOMEM;
50cfa66f0de02e Chao Yu      2020-03-03  356  =

cf30f6a5f0c60e Nick Terrell 2020-09-11  357  	stream =3D zstd_init_cstream(=
&params, 0, workspace, workspace_size);
50cfa66f0de02e Chao Yu      2020-03-03  358  	if (!stream) {
cf30f6a5f0c60e Nick Terrell 2020-09-11  359  		printk_ratelimited("%sF2FS-f=
s (%s): %s zstd_init_cstream failed\n",
50cfa66f0de02e Chao Yu      2020-03-03  360  				KERN_ERR, F2FS_I_SB(cc->in=
ode)->sb->s_id,
50cfa66f0de02e Chao Yu      2020-03-03  361  				__func__);
50cfa66f0de02e Chao Yu      2020-03-03  362  		kvfree(workspace);
50cfa66f0de02e Chao Yu      2020-03-03  363  		return -EIO;
50cfa66f0de02e Chao Yu      2020-03-03  364  	}
50cfa66f0de02e Chao Yu      2020-03-03  365  =

50cfa66f0de02e Chao Yu      2020-03-03  366  	cc->private =3D workspace;
50cfa66f0de02e Chao Yu      2020-03-03  367  	cc->private2 =3D stream;
50cfa66f0de02e Chao Yu      2020-03-03  368  =

50cfa66f0de02e Chao Yu      2020-03-03  369  	cc->clen =3D cc->rlen - PAGE_=
SIZE - COMPRESS_HEADER_SIZE;
50cfa66f0de02e Chao Yu      2020-03-03  370  	return 0;
50cfa66f0de02e Chao Yu      2020-03-03  371  }
50cfa66f0de02e Chao Yu      2020-03-03  372  =


:::::: The code at line 347 was first introduced by commit
:::::: 3fde13f817e23f05ce407d136325df4cbc913e67 f2fs: compress: support com=
press level

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1114074602870263509==--


Content-Type: multipart/mixed; boundary="===============8881291400599549689=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [nvdimm:libnvdimm-for-next 27/32] fs/ext2/inode.c:809:23: warning: Value stored to 'sbi' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 10 Dec 2021 12:38:20 +0800
Message-ID: <202112101242.ngLov0LI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8881291400599549689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-nvdimm(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Gao Xiang <hsiangkao@linux.alibaba.com>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git l=
ibnvdimm-for-next
head:   de291b5902860d18d6e02000808aeb833ec1feb6
commit: de2051147771017a61b62c02fd4e883c9b07712d [27/32] fsdax: shift parti=
tion offset handling into the file systems
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: riscv-randconfig-c006-20211209 (https://download.01.org/0day-ci/arc=
hive/20211210/202112101242.ngLov0LI-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git=
/commit/?id=3Dde2051147771017a61b62c02fd4e883c9b07712d
        git remote add nvdimm https://git.kernel.org/pub/scm/linux/kernel/g=
it/nvdimm/nvdimm.git
        git fetch --no-tags nvdimm libnvdimm-for-next
        git checkout de2051147771017a61b62c02fd4e883c9b07712d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/xfs_log_recover.c:149:6: note: Assuming 'error' is not equal to 0=
, which participates in a condition later
           if (error && !xlog_is_shutdown(log)) {
               ^~~~~
   fs/xfs/xfs_log_recover.c:149:6: note: Left side of '&&' is true
   fs/xfs/xfs_log_recover.c:149:15: note: Assuming the condition is false
           if (error && !xlog_is_shutdown(log)) {
                        ^~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:149:2: note: Taking false branch
           if (error && !xlog_is_shutdown(log)) {
           ^
   fs/xfs/xfs_log_recover.c:155:2: note: Returning value (loaded from 'erro=
r'), which participates in a condition later
           return error;
           ^~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:178:10: note: Returning from 'xlog_do_io'
           error =3D xlog_do_io(log, blk_no, nbblks, data, REQ_OP_READ);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:179:7: note: 'error' is not equal to 0, which p=
articipates in a condition later
           if (!error)
                ^~~~~
   fs/xfs/xfs_log_recover.c:179:2: note: Taking false branch
           if (!error)
           ^
   fs/xfs/xfs_log_recover.c:181:2: note: Returning value (loaded from 'erro=
r'), which participates in a condition later
           return error;
           ^~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:813:12: note: Returning from 'xlog_bread'
                           error =3D xlog_bread(log, i, 1, buffer, &offset);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:814:8: note: 'error' is not equal to 0, which p=
articipates in a condition later
                           if (error)
                               ^~~~~
   fs/xfs/xfs_log_recover.c:814:4: note: Taking true branch
                           if (error)
                           ^
   fs/xfs/xfs_log_recover.c:815:5: note: Control jumps to line 831
                                   goto out_error;
                                   ^
   fs/xfs/xfs_log_recover.c:831:2: note: Returning without writing to '*rhe=
ad'
           return error;
           ^
   fs/xfs/xfs_log_recover.c:831:2: note: Returning value (loaded from 'erro=
r'), which participates in a condition later
           return error;
           ^~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:1287:10: note: Returning from 'xlog_rseek_logre=
c_hdr'
           error =3D xlog_rseek_logrec_hdr(log, *head_blk, *head_blk, 1, bu=
ffer,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/xfs/xfs_log_recover.c:1289:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   fs/xfs/xfs_log_recover.c:1289:2: note: Taking false branch
           if (error < 0)
           ^
   fs/xfs/xfs_log_recover.c:1291:7: note: 'error' is not equal to 0
           if (!error) {
                ^~~~~
   fs/xfs/xfs_log_recover.c:1291:2: note: Taking false branch
           if (!error) {
           ^
   fs/xfs/xfs_log_recover.c:1296:24: note: Access to field 'h_tail_lsn' res=
ults in a dereference of an undefined pointer value (loaded from variable '=
rhead')
           *tail_blk =3D BLOCK_LSN(be64_to_cpu(rhead->h_tail_lsn));
                                 ^
   include/linux/byteorder/generic.h:93:21: note: expanded from macro 'be64=
_to_cpu'
   #define be64_to_cpu __be64_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:38:58: note: expanded from =
macro '__be64_to_cpu'
   #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
                                                            ^~
   include/uapi/linux/swab.h:131:32: note: expanded from macro '__swab64'
           (__builtin_constant_p((__u64)(x)) ?     \
                                         ^
   fs/xfs/libxfs/xfs_log_format.h:52:32: note: expanded from macro 'BLOCK_L=
SN'
   #define BLOCK_LSN(lsn) ((uint)(lsn))
                                  ^~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> fs/ext2/inode.c:809:23: warning: Value stored to 'sbi' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct ext2_sb_info *sbi =3D EXT2_SB(inode->i_sb);
                                ^~~   ~~~~~~~~~~~~~~~~~~~~
   fs/ext2/inode.c:809:23: note: Value stored to 'sbi' during its initializ=
ation is never read
           struct ext2_sb_info *sbi =3D EXT2_SB(inode->i_sb);
                                ^~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   include/linux/hid.h:1007:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-dr.c:252:2: note: Control jumps to 'case 65589:'  at lin=
e 258
           switch (usage->hid) {
           ^
   drivers/hid/hid-dr.c:259:7: note: Assuming the condition is false
                   if (field->flags & HID_MAIN_ITEM_RELATIVE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-dr.c:259:3: note: Taking false branch
                   if (field->flags & HID_MAIN_ITEM_RELATIVE)
                   ^
   drivers/hid/hid-dr.c:262:4: note: Calling 'hid_map_usage'
                           map_abs(usage->hid & 0xf);
                           ^
   drivers/hid/hid-dr.c:245:25: note: expanded from macro 'map_abs'
   #define map_abs(c)      hid_map_usage(hi, usage, bit, max, EV_ABS, (c))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:982:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:986:2: note: Control jumps to 'case 3:'  at line 987
           switch (type) {
           ^
   include/linux/hid.h:990:3: note:  Execution continues on line 1005
                   break;
                   ^
   include/linux/hid.h:1005:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1005:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1006:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)

vim +/sbi +809 fs/ext2/inode.c

a686cd898bd999 Martin J. Bligh     2007-10-16  802  =

25f4e70291a309 Christoph Hellwig   2016-09-19  803  static int ext2_iomap_b=
egin(struct inode *inode, loff_t offset, loff_t length,
c039b997927263 Goldwyn Rodrigues   2019-10-18  804  		unsigned flags, struc=
t iomap *iomap, struct iomap *srcmap)
25f4e70291a309 Christoph Hellwig   2016-09-19  805  {
25f4e70291a309 Christoph Hellwig   2016-09-19  806  	unsigned int blkbits =
=3D inode->i_blkbits;
25f4e70291a309 Christoph Hellwig   2016-09-19  807  	unsigned long first_bl=
ock =3D offset >> blkbits;
25f4e70291a309 Christoph Hellwig   2016-09-19  808  	unsigned long max_bloc=
ks =3D (length + (1 << blkbits) - 1) >> blkbits;
8cf037a8b22f71 Dan Williams        2017-08-30 @809  	struct ext2_sb_info *s=
bi =3D EXT2_SB(inode->i_sb);
25f4e70291a309 Christoph Hellwig   2016-09-19  810  	bool new =3D false, bo=
undary =3D false;
25f4e70291a309 Christoph Hellwig   2016-09-19  811  	u32 bno;
25f4e70291a309 Christoph Hellwig   2016-09-19  812  	int ret;
25f4e70291a309 Christoph Hellwig   2016-09-19  813  =

25f4e70291a309 Christoph Hellwig   2016-09-19  814  	ret =3D ext2_get_block=
s(inode, first_block, max_blocks,
25f4e70291a309 Christoph Hellwig   2016-09-19  815  			&bno, &new, &boundar=
y, flags & IOMAP_WRITE);
25f4e70291a309 Christoph Hellwig   2016-09-19  816  	if (ret < 0)
a686cd898bd999 Martin J. Bligh     2007-10-16  817  		return ret;
a686cd898bd999 Martin J. Bligh     2007-10-16  818  =

25f4e70291a309 Christoph Hellwig   2016-09-19  819  	iomap->flags =3D 0;
d5bfccdf38d094 Christoph Hellwig   2016-10-03  820  	iomap->offset =3D (u64=
)first_block << blkbits;
de205114777101 Christoph Hellwig   2021-11-29  821  	if (flags & IOMAP_DAX)
8cf037a8b22f71 Dan Williams        2017-08-30  822  		iomap->dax_dev =3D sb=
i->s_daxdev;
de205114777101 Christoph Hellwig   2021-11-29  823  	else
de205114777101 Christoph Hellwig   2021-11-29  824  		iomap->bdev =3D inode=
->i_sb->s_bdev;
25f4e70291a309 Christoph Hellwig   2016-09-19  825  =

25f4e70291a309 Christoph Hellwig   2016-09-19  826  	if (ret =3D=3D 0) {
25f4e70291a309 Christoph Hellwig   2016-09-19  827  		iomap->type =3D IOMAP=
_HOLE;
19fe5f643f89f2 Andreas Gruenbacher 2017-10-01  828  		iomap->addr =3D IOMAP=
_NULL_ADDR;
25f4e70291a309 Christoph Hellwig   2016-09-19  829  		iomap->length =3D 1 <=
< blkbits;
25f4e70291a309 Christoph Hellwig   2016-09-19  830  	} else {
25f4e70291a309 Christoph Hellwig   2016-09-19  831  		iomap->type =3D IOMAP=
_MAPPED;
19fe5f643f89f2 Andreas Gruenbacher 2017-10-01  832  		iomap->addr =3D (u64)=
bno << blkbits;
de205114777101 Christoph Hellwig   2021-11-29  833  		if (flags & IOMAP_DAX)
de205114777101 Christoph Hellwig   2021-11-29  834  			iomap->addr +=3D sbi=
->s_dax_part_off;
25f4e70291a309 Christoph Hellwig   2016-09-19  835  		iomap->length =3D (u6=
4)ret << blkbits;
25f4e70291a309 Christoph Hellwig   2016-09-19  836  		iomap->flags |=3D IOM=
AP_F_MERGED;
25f4e70291a309 Christoph Hellwig   2016-09-19  837  	}
25f4e70291a309 Christoph Hellwig   2016-09-19  838  =

25f4e70291a309 Christoph Hellwig   2016-09-19  839  	if (new)
25f4e70291a309 Christoph Hellwig   2016-09-19  840  		iomap->flags |=3D IOM=
AP_F_NEW;
25f4e70291a309 Christoph Hellwig   2016-09-19  841  	return 0;
a686cd898bd999 Martin J. Bligh     2007-10-16  842  }
a686cd898bd999 Martin J. Bligh     2007-10-16  843  =


:::::: The code at line 809 was first introduced by commit
:::::: 8cf037a8b22f71c6659bd0246bfaba9e79766f64 ext2: perform dax_device lo=
okup at mount

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8881291400599549689==--


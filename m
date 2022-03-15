Content-Type: multipart/mixed; boundary="===============5868042031371872642=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jlayton:ceph-fscrypt-sparse 72/74] fs/ceph/file.c:1032:9: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 16 Mar 2022 01:41:12 +0800
Message-ID: <202203160140.iGHTGRjA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5868042031371872642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git c=
eph-fscrypt-sparse
head:   0d355bda666e44314f11974167e8d9bb010a539e
commit: cbe05f4053d9f2f72668b9385e0e14c11c9adf32 [72/74] ceph: use r_pp for=
 sparse reads
:::::: branch date: 21 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20316/202203160140.iGHTGRjA-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f5=
0fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git=
/commit/?id=3Dcbe05f4053d9f2f72668b9385e0e14c11c9adf32
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/=
git/jlayton/linux.git
        git fetch --no-tags jlayton ceph-fscrypt-sparse
        git checkout cbe05f4053d9f2f72668b9385e0e14c11c9adf32
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                            ^
   kernel/time/ntp.c:315:2: note: The value -500000000 is assigned to 'offs=
et'
           offset =3D clamp(offset, -MAXPHASE, MAXPHASE);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:322:6: note: Assuming the condition is true
           if (unlikely(time_status & STA_FREQHOLD))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   kernel/time/ntp.c:322:2: note: Taking false branch
           if (unlikely(time_status & STA_FREQHOLD))
           ^
   kernel/time/ntp.c:327:2: note: The value -500000000 is assigned to 'offs=
et64'
           offset64    =3D offset;
           ^~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:335:15: note: Assuming the condition is false
           if (unlikely(secs > 1 << (SHIFT_PLL + 1 + time_constant)))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/time/ntp.c:335:2: note: Taking false branch
           if (unlikely(secs > 1 << (SHIFT_PLL + 1 + time_constant)))
           ^
   kernel/time/ntp.c:341:16: note: Assuming '__UNIQUE_ID___x366' is >=3D '_=
_UNIQUE_ID___y367'
           freq_adj    =3D min(freq_adj + time_freq, MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   kernel/time/ntp.c:341:16: note: '?' condition is false
           freq_adj    =3D min(freq_adj + time_freq, MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   kernel/time/ntp.c:343:16: note: '__UNIQUE_ID___x368' is > '__UNIQUE_ID__=
_y369'
           time_freq   =3D max(freq_adj, -MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   kernel/time/ntp.c:343:16: note: '?' condition is true
           time_freq   =3D max(freq_adj, -MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   kernel/time/ntp.c:345:33: note: The result of the left shift is undefine=
d because the left operand is negative
           time_offset =3D div_s64(offset64 << NTP_SCALE_SHIFT, NTP_INTERVA=
L_FREQ);
                                 ~~~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/ceph/file.c:314:7: warning: Value stored to 'issued' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
                   int issued =3D __ceph_caps_issued(ci, NULL);
                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:314:7: note: Value stored to 'issued' during its initiali=
zation is never read
                   int issued =3D __ceph_caps_issued(ci, NULL);
                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/file.c:1032:9: warning: The left expression of the compound assi=
gnment is an uninitialized value. The computed value will also be garbage [=
clang-analyzer-core.uninitialized.Assign]
                           fret -=3D (off - read_off);
                                ^
   fs/ceph/file.c:1886:2: note: Taking false branch
           dout("aio_read %p %llx.%llx %llu~%u trying to get caps on %p\n",
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ceph/file.c:1889:2: note: Taking false branch
           if (ceph_inode_is_shutdown(inode))
           ^
   fs/ceph/file.c:1892:6: note: Assuming 'direct_lock' is false
           if (direct_lock)
               ^~~~~~~~~~~
   fs/ceph/file.c:1892:2: note: Taking false branch
           if (direct_lock)
           ^
   fs/ceph/file.c:1897:6: note: Assuming the condition is false
           if (!(fi->flags & CEPH_F_SYNC) && !direct_lock)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:1897:33: note: Left side of '&&' is false
           if (!(fi->flags & CEPH_F_SYNC) && !direct_lock)
                                          ^
   fs/ceph/file.c:1899:6: note: Assuming the condition is false
           if (fi->fmode & CEPH_FILE_MODE_LAZY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:1899:2: note: Taking false branch
           if (fi->fmode & CEPH_FILE_MODE_LAZY)
           ^
   fs/ceph/file.c:1903:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   fs/ceph/file.c:1903:2: note: Taking false branch
           if (ret < 0) {
           ^
   fs/ceph/file.c:1911:6: note: Assuming the condition is true
           if ((got & (CEPH_CAP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO)) =3D=3D 0 =
||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:1911:62: note: Left side of '||' is true
           if ((got & (CEPH_CAP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO)) =3D=3D 0 =
||
                                                                       ^
   fs/ceph/file.c:1915:3: note: Taking false branch
                   dout("aio_sync_read %p %llx.%llx %llu~%u got cap refs on=
 %s\n",
                   ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ceph/file.c:1919:7: note: Assuming the condition is true
                   if (ci->i_inline_version =3D=3D CEPH_INLINE_NONE) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:1919:3: note: Taking true branch
                   if (ci->i_inline_version =3D=3D CEPH_INLINE_NONE) {
                   ^
   fs/ceph/file.c:1920:9: note: 'retry_op' is 0
                           if (!retry_op &&
                                ^~~~~~~~
   fs/ceph/file.c:1920:8: note: Left side of '&&' is true
                           if (!retry_op &&
                               ^
   fs/ceph/file.c:1921:39: note: Left side of '&&' is false
                               (iocb->ki_flags & IOCB_DIRECT) &&
                                                              ^
   fs/ceph/file.c:1928:11: note: Calling 'ceph_sync_read'
                                   ret =3D ceph_sync_read(iocb, to, &retry_=
op);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:1108:2: note: Taking false branch
           dout("sync_read on file %p %llu~%u %s\n", file, iocb->ki_pos,
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ceph/file.c:1112:9: note: Calling '__ceph_sync_read'
           return __ceph_sync_read(inode, &iocb->ki_pos, to, retry_op, NULL=
);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:945:2: note: Taking false branch
           dout("sync_read on inode %p %llu~%u\n", inode, *ki_pos, (unsigne=
d)len);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)

vim +1032 fs/ceph/file.c

83701246aee8f83 Yan, Zheng   2014-11-14   921  =

124e68e74099090 Sage Weil    2009-10-06   922  /*
124e68e74099090 Sage Weil    2009-10-06   923   * Completely synchronous re=
ad and write methods.  Direct from __user
124e68e74099090 Sage Weil    2009-10-06   924   * buffer to osd, or directl=
y to user pages (if O_DIRECT).
124e68e74099090 Sage Weil    2009-10-06   925   *
fce7a9744bdf3ba Yan, Zheng   2018-09-29   926   * If the read spans object =
boundary, just do multiple reads.  (That's not
fce7a9744bdf3ba Yan, Zheng   2018-09-29   927   * atomic, but good enough f=
or now.)
fce7a9744bdf3ba Yan, Zheng   2018-09-29   928   *
fce7a9744bdf3ba Yan, Zheng   2018-09-29   929   * If we get a short result =
from the OSD, check against i_size; we need to
fce7a9744bdf3ba Yan, Zheng   2018-09-29   930   * only return a short read =
to the caller if we hit EOF.
124e68e74099090 Sage Weil    2009-10-06   931   */
1c3b32d36296389 Xiubo Li     2021-11-05   932  ssize_t __ceph_sync_read(str=
uct inode *inode, loff_t *ki_pos,
cd6ba7d365023a0 Xiubo Li     2021-12-08   933  			 struct iov_iter *to, int=
 *retry_op,
cd6ba7d365023a0 Xiubo Li     2021-12-08   934  			 u64 *last_objver)
124e68e74099090 Sage Weil    2009-10-06   935  {
fce7a9744bdf3ba Yan, Zheng   2018-09-29   936  	struct ceph_inode_info *ci =
=3D ceph_inode(inode);
fce7a9744bdf3ba Yan, Zheng   2018-09-29   937  	struct ceph_fs_client *fsc =
=3D ceph_inode_to_client(inode);
fce7a9744bdf3ba Yan, Zheng   2018-09-29   938  	struct ceph_osd_client *osd=
c =3D &fsc->client->osdc;
7ce469a53e7106a Yan, Zheng   2016-11-08   939  	ssize_t ret;
1c3b32d36296389 Xiubo Li     2021-11-05   940  	u64 off =3D *ki_pos;
fce7a9744bdf3ba Yan, Zheng   2018-09-29   941  	u64 len =3D iov_iter_count(=
to);
e485d028bb1075d Jeff Layton  2021-11-23   942  	u64 i_size =3D i_size_read(=
inode);
cd6ba7d365023a0 Xiubo Li     2021-12-08   943  	u64 objver =3D 0;
124e68e74099090 Sage Weil    2009-10-06   944  =

1c3b32d36296389 Xiubo Li     2021-11-05   945  	dout("sync_read on inode %p=
 %llu~%u\n", inode, *ki_pos, (unsigned)len);
d0d0db2268cc343 Yan, Zheng   2014-07-21   946  =

d0d0db2268cc343 Yan, Zheng   2014-07-21   947  	if (!len)
d0d0db2268cc343 Yan, Zheng   2014-07-21   948  		return 0;
124e68e74099090 Sage Weil    2009-10-06   949  	/*
124e68e74099090 Sage Weil    2009-10-06   950  	 * flush any page cache pag=
es in this range.  this
e98b6fed84d0f01 Sage Weil    2010-11-09   951  	 * will make concurrent nor=
mal and sync io slow,
124e68e74099090 Sage Weil    2009-10-06   952  	 * but it will at least beh=
ave sensibly when they are
124e68e74099090 Sage Weil    2009-10-06   953  	 * in sequence.
124e68e74099090 Sage Weil    2009-10-06   954  	 */
e450f4d1a5d633d zhengbin     2019-02-01   955  	ret =3D filemap_write_and_w=
ait_range(inode->i_mapping,
e450f4d1a5d633d zhengbin     2019-02-01   956  					   off, off + len - 1);
29065a513aa4c7e Yehuda Sadeh 2010-02-09   957  	if (ret < 0)
8eb4efb091c8d8f majianpeng   2013-09-26   958  		return ret;
29065a513aa4c7e Yehuda Sadeh 2010-02-09   959  =

fce7a9744bdf3ba Yan, Zheng   2018-09-29   960  	ret =3D 0;
fce7a9744bdf3ba Yan, Zheng   2018-09-29   961  	while ((len =3D iov_iter_co=
unt(to)) > 0) {
fce7a9744bdf3ba Yan, Zheng   2018-09-29   962  		struct ceph_osd_request *r=
eq;
fce7a9744bdf3ba Yan, Zheng   2018-09-29   963  		struct page **pages;
fce7a9744bdf3ba Yan, Zheng   2018-09-29   964  		int num_pages;
7ce469a53e7106a Yan, Zheng   2016-11-08   965  		size_t page_off;
fce7a9744bdf3ba Yan, Zheng   2018-09-29   966  		bool more;
c5f575ed08c38d0 Jeff Layton  2020-08-21   967  		int idx;
c5f575ed08c38d0 Jeff Layton  2020-08-21   968  		size_t left;
7b8289467f2eaaf Jeff Layton  2021-01-28   969  		u64 read_off =3D off;
7b8289467f2eaaf Jeff Layton  2021-01-28   970  		u64 read_len =3D len;
7b8289467f2eaaf Jeff Layton  2021-01-28   971  =

7b8289467f2eaaf Jeff Layton  2021-01-28   972  		/* determine new offset/le=
ngth if encrypted */
7b8289467f2eaaf Jeff Layton  2021-01-28   973  		ceph_fscrypt_adjust_off_an=
d_len(inode, &read_off, &read_len);
7b8289467f2eaaf Jeff Layton  2021-01-28   974  =

7b8289467f2eaaf Jeff Layton  2021-01-28   975  		dout("sync_read orig %llu~=
%llu reading %llu~%llu",
7b8289467f2eaaf Jeff Layton  2021-01-28   976  		     off, len, read_off, r=
ead_len);
fce7a9744bdf3ba Yan, Zheng   2018-09-29   977  =

fce7a9744bdf3ba Yan, Zheng   2018-09-29   978  		req =3D ceph_osdc_new_requ=
est(osdc, &ci->i_layout,
7b8289467f2eaaf Jeff Layton  2021-01-28   979  					ci->i_vino, read_off, &=
read_len, 0, 1,
5020f1a5464bf0c Jeff Layton  2022-02-26   980  					CEPH_OSD_OP_SPARSE_READ=
, CEPH_OSD_FLAG_READ,
fce7a9744bdf3ba Yan, Zheng   2018-09-29   981  					NULL, ci->i_truncate_se=
q,
fce7a9744bdf3ba Yan, Zheng   2018-09-29   982  					ci->i_truncate_size, fa=
lse);
fce7a9744bdf3ba Yan, Zheng   2018-09-29   983  		if (IS_ERR(req)) {
fce7a9744bdf3ba Yan, Zheng   2018-09-29   984  			ret =3D PTR_ERR(req);
fce7a9744bdf3ba Yan, Zheng   2018-09-29   985  			break;
fce7a9744bdf3ba Yan, Zheng   2018-09-29   986  		}
fce7a9744bdf3ba Yan, Zheng   2018-09-29   987  =

7b8289467f2eaaf Jeff Layton  2021-01-28   988  		/* adjust len downward if =
the request truncated the len */
7b8289467f2eaaf Jeff Layton  2021-01-28   989  		if (off + len > read_off +=
 read_len)
7b8289467f2eaaf Jeff Layton  2021-01-28   990  			len =3D read_off + read_l=
en - off;
fce7a9744bdf3ba Yan, Zheng   2018-09-29   991  		more =3D len < iov_iter_co=
unt(to);
fce7a9744bdf3ba Yan, Zheng   2018-09-29   992  =

7b8289467f2eaaf Jeff Layton  2021-01-28   993  		num_pages =3D calc_pages_f=
or(read_off, read_len);
7b8289467f2eaaf Jeff Layton  2021-01-28   994  		page_off =3D offset_in_pag=
e(off);
fce7a9744bdf3ba Yan, Zheng   2018-09-29   995  		pages =3D ceph_alloc_page_=
vector(num_pages, GFP_KERNEL);
fce7a9744bdf3ba Yan, Zheng   2018-09-29   996  		if (IS_ERR(pages)) {
fce7a9744bdf3ba Yan, Zheng   2018-09-29   997  			ceph_osdc_put_request(req=
);
fce7a9744bdf3ba Yan, Zheng   2018-09-29   998  			ret =3D PTR_ERR(pages);
fce7a9744bdf3ba Yan, Zheng   2018-09-29   999  			break;
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1000  		}
7ce469a53e7106a Yan, Zheng   2016-11-08  1001  =

7b8289467f2eaaf Jeff Layton  2021-01-28  1002  		osd_req_op_extent_osd_data=
_pages(req, 0, pages, read_len,
7b8289467f2eaaf Jeff Layton  2021-01-28  1003  						 offset_in_page(read_o=
ff),
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1004  						 false, false);
cbe05f4053d9f2f Jeff Layton  2022-03-11  1005  		ihold(inode);
cbe05f4053d9f2f Jeff Layton  2022-03-11  1006  		req->r_inode =3D inode;
cbe05f4053d9f2f Jeff Layton  2022-03-11  1007  		req->r_pp =3D ceph_sparse_=
read_pp;
cbe05f4053d9f2f Jeff Layton  2022-03-11  1008  =

fce7a9744bdf3ba Yan, Zheng   2018-09-29  1009  		ret =3D ceph_osdc_start_re=
quest(osdc, req, false);
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1010  		if (!ret)
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1011  			ret =3D ceph_osdc_wait_re=
quest(osdc, req);
97e27aaa9a2cbd6 Xiubo Li     2020-03-19  1012  =

8ae99ae2b40766a Xiubo Li     2021-03-22  1013  		ceph_update_read_metrics(&=
fsc->mdsc->metric,
97e27aaa9a2cbd6 Xiubo Li     2020-03-19  1014  					 req->r_start_latency,
97e27aaa9a2cbd6 Xiubo Li     2020-03-19  1015  					 req->r_end_latency,
7b8289467f2eaaf Jeff Layton  2021-01-28  1016  					 read_len, ret);
97e27aaa9a2cbd6 Xiubo Li     2020-03-19  1017  =

cd6ba7d365023a0 Xiubo Li     2021-12-08  1018  		if (ret > 0)
cd6ba7d365023a0 Xiubo Li     2021-12-08  1019  			objver =3D req->r_version;
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1020  		ceph_osdc_put_request(req);
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1021  		i_size =3D i_size_read(ino=
de);
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1022  		dout("sync_read %llu~%llu =
got %zd i_size %llu%s\n",
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1023  		     off, len, ret, i_size=
, (more ? " MORE" : ""));
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1024  =

7b8289467f2eaaf Jeff Layton  2021-01-28  1025  		if (ret =3D=3D -ENOENT) {
7b8289467f2eaaf Jeff Layton  2021-01-28  1026  			/* No object? Then this i=
s a hole */
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1027  			ret =3D 0;
7b8289467f2eaaf Jeff Layton  2021-01-28  1028  		} else if (ret > 0 && IS_E=
NCRYPTED(inode)) {
7b8289467f2eaaf Jeff Layton  2021-01-28  1029  			int fret;
7b8289467f2eaaf Jeff Layton  2021-01-28  1030  =

7b8289467f2eaaf Jeff Layton  2021-01-28  1031  			/* account for any partia=
l block at the beginning */
7b8289467f2eaaf Jeff Layton  2021-01-28 @1032  			fret -=3D (off - read_off=
);
7b8289467f2eaaf Jeff Layton  2021-01-28  1033  =

7b8289467f2eaaf Jeff Layton  2021-01-28  1034  			/*
7b8289467f2eaaf Jeff Layton  2021-01-28  1035  			 * Short read after big o=
ffset adjustment?
7b8289467f2eaaf Jeff Layton  2021-01-28  1036  			 * Nothing is usable, jus=
t call it a zero
7b8289467f2eaaf Jeff Layton  2021-01-28  1037  			 * len read.
7b8289467f2eaaf Jeff Layton  2021-01-28  1038  			 */
7b8289467f2eaaf Jeff Layton  2021-01-28  1039  			fret =3D max(fret, 0);
7b8289467f2eaaf Jeff Layton  2021-01-28  1040  =

7b8289467f2eaaf Jeff Layton  2021-01-28  1041  			/* account for partial bl=
ock at the end */
7b8289467f2eaaf Jeff Layton  2021-01-28  1042  			ret =3D min_t(ssize_t, fr=
et, len);
7b8289467f2eaaf Jeff Layton  2021-01-28  1043  		}
7b8289467f2eaaf Jeff Layton  2021-01-28  1044  =

7b8289467f2eaaf Jeff Layton  2021-01-28  1045  		/* Short read but not EOF?=
 Zero out the remainder. */
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1046  		if (ret >=3D 0 && ret < le=
n && (off + ret < i_size)) {
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1047  			int zlen =3D min(len - re=
t, i_size - off - ret);
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1048  			int zoff =3D page_off + r=
et;
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1049  			dout("sync_read zero gap =
%llu~%llu\n",
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1050  			     off + ret, off + ret=
 + zlen);
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1051  			ceph_zero_page_vector_ran=
ge(zoff, zlen, pages);
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1052  			ret +=3D zlen;
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1053  		}
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1054  =

c5f575ed08c38d0 Jeff Layton  2020-08-21  1055  		idx =3D 0;
c5f575ed08c38d0 Jeff Layton  2020-08-21  1056  		left =3D ret > 0 ? ret : 0;
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1057  		while (left > 0) {
7b8289467f2eaaf Jeff Layton  2021-01-28  1058  			size_t plen, copied;
7b8289467f2eaaf Jeff Layton  2021-01-28  1059  			plen =3D min_t(size_t, le=
ft, PAGE_SIZE - page_off);
c5f575ed08c38d0 Jeff Layton  2020-08-21  1060  			SetPageUptodate(pages[idx=
]);
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1061  			copied =3D copy_page_to_i=
ter(pages[idx++],
7b8289467f2eaaf Jeff Layton  2021-01-28  1062  						   page_off, plen, to);
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1063  			off +=3D copied;
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1064  			left -=3D copied;
7b8289467f2eaaf Jeff Layton  2021-01-28  1065  			page_off =3D 0;
7b8289467f2eaaf Jeff Layton  2021-01-28  1066  			if (copied < plen) {
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1067  				ret =3D -EFAULT;
8eb4efb091c8d8f majianpeng   2013-09-26  1068  				break;
8eb4efb091c8d8f majianpeng   2013-09-26  1069  			}
8eb4efb091c8d8f majianpeng   2013-09-26  1070  		}
124e68e74099090 Sage Weil    2009-10-06  1071  		ceph_release_page_vector(p=
ages, num_pages);
8eb4efb091c8d8f majianpeng   2013-09-26  1072  =

131d7eb4faa1fc0 Yan, Zheng   2019-07-25  1073  		if (ret < 0) {
0b98acd61883093 Ilya Dryomov 2020-09-14  1074  			if (ret =3D=3D -EBLOCKLIS=
TED)
0b98acd61883093 Ilya Dryomov 2020-09-14  1075  				fsc->blocklisted =3D tru=
e;
131d7eb4faa1fc0 Yan, Zheng   2019-07-25  1076  			break;
131d7eb4faa1fc0 Yan, Zheng   2019-07-25  1077  		}
131d7eb4faa1fc0 Yan, Zheng   2019-07-25  1078  =

131d7eb4faa1fc0 Yan, Zheng   2019-07-25  1079  		if (off >=3D i_size || !mo=
re)
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1080  			break;
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1081  	}
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1082  =

7b8289467f2eaaf Jeff Layton  2021-01-28  1083  	if (ret > 0) {
1c3b32d36296389 Xiubo Li     2021-11-05  1084  		if (off > *ki_pos) {
c3d8e0b5de487a7 Xiubo Li     2021-10-30  1085  			if (off >=3D i_size) {
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1086  				*retry_op =3D CHECK_EOF;
1c3b32d36296389 Xiubo Li     2021-11-05  1087  				ret =3D i_size - *ki_pos;
1c3b32d36296389 Xiubo Li     2021-11-05  1088  				*ki_pos =3D i_size;
c3d8e0b5de487a7 Xiubo Li     2021-10-30  1089  			} else {
1c3b32d36296389 Xiubo Li     2021-11-05  1090  				ret =3D off - *ki_pos;
1c3b32d36296389 Xiubo Li     2021-11-05  1091  				*ki_pos =3D off;
8eb4efb091c8d8f majianpeng   2013-09-26  1092  			}
c3d8e0b5de487a7 Xiubo Li     2021-10-30  1093  		}
8eb4efb091c8d8f majianpeng   2013-09-26  1094  =

7b8289467f2eaaf Jeff Layton  2021-01-28  1095  		if (last_objver)
cd6ba7d365023a0 Xiubo Li     2021-12-08  1096  			*last_objver =3D objver;
7b8289467f2eaaf Jeff Layton  2021-01-28  1097  	}
fce7a9744bdf3ba Yan, Zheng   2018-09-29  1098  	dout("sync_read result %zd =
retry_op %d\n", ret, *retry_op);
124e68e74099090 Sage Weil    2009-10-06  1099  	return ret;
124e68e74099090 Sage Weil    2009-10-06  1100  }
124e68e74099090 Sage Weil    2009-10-06  1101  =


:::::: The code at line 1032 was first introduced by commit
:::::: 7b8289467f2eaafe662a32ddc148c8302b4c1ef6 ceph: plumb in decryption d=
uring sync reads

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Jeff Layton <jlayton@kernel.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5868042031371872642==--


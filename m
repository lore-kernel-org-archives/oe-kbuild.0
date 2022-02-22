Content-Type: multipart/mixed; boundary="===============5472773439706597549=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ceph-client:wip-fscrypt 58/63] fs/ceph/file.c:1793:9: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Wed, 23 Feb 2022 01:03:04 +0800
Message-ID: <202202230006.5e56X7Es-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5472773439706597549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: ceph-devel(a)vger.kernel.org
TO: Jeff Layton <jlayton@kernel.org>

tree:   https://github.com/ceph/ceph-client.git wip-fscrypt
head:   4ec0d0e0cc68c6525ace02e7a8a5bb57a4242997
commit: fcb8f573d113365f8f0d226a6744b3c40494dcfe [58/63] ceph: add read/mod=
ify/write to ceph_sync_write
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20223/202202230006.5e56X7Es-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ceph/ceph-client/commit/fcb8f573d113365f8f0d22=
6a6744b3c40494dcfe
        git remote add ceph-client https://github.com/ceph/ceph-client.git
        git fetch --no-tags ceph-client wip-fscrypt
        git checkout fcb8f573d113365f8f0d226a6744b3c40494dcfe
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/nfs/nfs4namespace.c:300:14: note: 's' is < field 'nservers'
           for (s =3D 0; s < location->nservers; s++) {
                       ^
   fs/nfs/nfs4namespace.c:300:2: note: Loop condition is true.  Entering lo=
op body
           for (s =3D 0; s < location->nservers; s++) {
           ^
   fs/nfs/nfs4namespace.c:302:7: note: Assuming 'len' is >=3D field 'len'
                   if (buf->len > len)
                       ^~~~~~~~~~~~~~
   fs/nfs/nfs4namespace.c:302:3: note: Taking false branch
                   if (buf->len > len)
                   ^
   fs/nfs/nfs4namespace.c:300:14: note: Assuming 's' is >=3D field 'nserver=
s'
           for (s =3D 0; s < location->nservers; s++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4namespace.c:300:2: note: Loop condition is false. Execution c=
ontinues on line 306
           for (s =3D 0; s < location->nservers; s++) {
           ^
   fs/nfs/nfs4namespace.c:308:6: note: Assuming field 'hostname' is non-null
           if (!ctx->nfs_server.hostname)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4namespace.c:308:2: note: Taking false branch
           if (!ctx->nfs_server.hostname)
           ^
   fs/nfs/nfs4namespace.c:311:16: note: Calling 'nfs4_pathname_string'
           export_path =3D nfs4_pathname_string(&location->rootpath,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4namespace.c:65:6: note: Assuming 'len' is >=3D 0
           if (len < 0)
               ^~~~~~~
   fs/nfs/nfs4namespace.c:65:2: note: Taking false branch
           if (len < 0)
           ^
   fs/nfs/nfs4namespace.c:69:12: note: Memory is allocated
           p =3D buf =3D kmalloc(len + 1, GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4namespace.c:70:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   fs/nfs/nfs4namespace.c:70:2: note: Taking false branch
           if (!buf)
           ^
   fs/nfs/nfs4namespace.c:73:14: note: 'i' is < field 'ncomponents'
           for (i =3D 0; i < pathname->ncomponents; i++) {
                       ^
   fs/nfs/nfs4namespace.c:73:2: note: Loop condition is true.  Entering loo=
p body
           for (i =3D 0; i < pathname->ncomponents; i++) {
           ^
   fs/nfs/nfs4namespace.c:73:14: note: Assuming 'i' is >=3D field 'ncompone=
nts'
           for (i =3D 0; i < pathname->ncomponents; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4namespace.c:73:2: note: Loop condition is false. Execution co=
ntinues on line 81
           for (i =3D 0; i < pathname->ncomponents; i++) {
           ^
   fs/nfs/nfs4namespace.c:311:16: note: Returned allocated memory
           export_path =3D nfs4_pathname_string(&location->rootpath,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4namespace.c:313:2: note: Taking true branch
           if (IS_ERR(export_path))
           ^
   fs/nfs/nfs4namespace.c:391:11: note: Returned allocated memory
                   error =3D try_location(fc, location);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4namespace.c:392:7: note: Assuming 'error' is equal to 0
                   if (error =3D=3D 0)
                       ^~~~~~~~~~
   fs/nfs/nfs4namespace.c:392:3: note: Taking true branch
                   if (error =3D=3D 0)
                   ^
   fs/nfs/nfs4namespace.c:393:11: note: Potential memory leak
                           return 0;
                                  ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/usb/early/xhci-dbc.c:274:2: warning: Value stored to 'index' is =
never read [clang-analyzer-deadcode.DeadStores]
           index +=3D XDBC_STRING_ENTRY_NUM;
           ^
   drivers/usb/early/xhci-dbc.c:274:2: note: Value stored to 'index' is nev=
er read
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/ceph/file.c:314:7: warning: Value stored to 'issued' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
                   int issued =3D __ceph_caps_issued(ci, NULL);
                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:314:7: note: Value stored to 'issued' during its initiali=
zation is never read
                   int issued =3D __ceph_caps_issued(ci, NULL);
                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/file.c:1793:9: warning: Branch condition evaluates to a garbage =
value [clang-analyzer-core.uninitialized.Branch]
                           if ((assert_ver && (ret =3D=3D -ERANGE || ret =
=3D=3D -EOVERFLOW)) ||
                                ^~~~~~~~~~
   fs/ceph/file.c:1521:6: note: Assuming the condition is false
           if (ceph_snap(file_inode(file)) !=3D CEPH_NOSNAP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:1521:2: note: Taking false branch
           if (ceph_snap(file_inode(file)) !=3D CEPH_NOSNAP)
           ^
   fs/ceph/file.c:1524:2: note: Taking false branch
           dout("sync_write on file %p %lld~%u snapc %p seq %lld\n",
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
   fs/ceph/file.c:1529:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   fs/ceph/file.c:1529:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/ceph/file.c:1536:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   fs/ceph/file.c:1536:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/ceph/file.c:1539:9: note: Assuming the condition is true
           while ((len =3D iov_iter_count(from)) > 0) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:1539:2: note: Loop condition is true.  Entering loop body
           while ((len =3D iov_iter_count(from)) > 0) {
           ^
   fs/ceph/file.c:1546:3: note: 'assert_ver' declared without an initial va=
lue
                   u64 assert_ver;
                   ^~~~~~~~~~~~~~
   fs/ceph/file.c:1561:7: note: Assuming the condition is false
                   if (pos + len > write_pos + write_len)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:1561:3: note: Taking false branch
                   if (pos + len > write_pos + write_len)
                   ^
   fs/ceph/file.c:1571:10: note: Assuming the condition is false
                   last =3D (pos + len) !=3D (write_pos + write_len);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:1572:9: note: 'first' is false
                   rmw =3D first || last;
                         ^~~~~
   fs/ceph/file.c:1572:9: note: Left side of '||' is false
   fs/ceph/file.c:1574:3: note: Taking false branch
                   dout("sync_write ino %llx %lld~%llu adjusted %lld~%llu -=
- %srmw\n",
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
   fs/ceph/file.c:1583:7: note: Calling 'IS_ERR'
                   if (IS_ERR(pages)) {
                       ^~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:1583:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(pages)) {
                       ^~~~~~~~~~~~~
   fs/ceph/file.c:1583:3: note: Taking false branch
                   if (IS_ERR(pages)) {
                   ^
   fs/ceph/file.c:1589:7: note: 'rmw' is false
                   if (rmw) {
                       ^~~
   fs/ceph/file.c:1589:3: note: Taking false branch
                   if (rmw) {
                   ^
   fs/ceph/file.c:1718:15: note: Assuming 'n' is >=3D 'num_pages'
                   for (n =3D 0; n < num_pages; n++) {
                               ^~~~~~~~~~~~~
   fs/ceph/file.c:1718:3: note: Loop condition is false. Execution continue=
s on line 1730
                   for (n =3D 0; n < num_pages; n++) {
                   ^
   fs/ceph/file.c:1730:7: note: 'ret' is >=3D 0

vim +1793 fs/ceph/file.c

e8344e668915a7 majianpeng         2013-09-12  1494  =

e8344e668915a7 majianpeng         2013-09-12  1495  /*
e8344e668915a7 majianpeng         2013-09-12  1496   * Synchronous write, s=
traight from __user pointer or user pages.
e8344e668915a7 majianpeng         2013-09-12  1497   *
e8344e668915a7 majianpeng         2013-09-12  1498   * If write spans objec=
t boundary, just do multiple writes.  (For a
e8344e668915a7 majianpeng         2013-09-12  1499   * correct atomic write=
, we should e.g. take write locks on all
e8344e668915a7 majianpeng         2013-09-12  1500   * objects, rollback on=
 failure, etc.)
e8344e668915a7 majianpeng         2013-09-12  1501   */
06fee30f6a31f1 Yan, Zheng         2014-07-28  1502  static ssize_t
5dda377cf0a6bd Yan, Zheng         2015-04-30  1503  ceph_sync_write(struct =
kiocb *iocb, struct iov_iter *from, loff_t pos,
5dda377cf0a6bd Yan, Zheng         2015-04-30  1504  		struct ceph_snap_cont=
ext *snapc)
e8344e668915a7 majianpeng         2013-09-12  1505  {
e8344e668915a7 majianpeng         2013-09-12  1506  	struct file *file =3D =
iocb->ki_filp;
e8344e668915a7 majianpeng         2013-09-12  1507  	struct inode *inode =
=3D file_inode(file);
e8344e668915a7 majianpeng         2013-09-12  1508  	struct ceph_inode_info=
 *ci =3D ceph_inode(inode);
e8344e668915a7 majianpeng         2013-09-12  1509  	struct ceph_fs_client =
*fsc =3D ceph_inode_to_client(inode);
fcb8f573d11336 Jeff Layton        2021-01-27  1510  	struct ceph_osd_client=
 *osdc =3D &fsc->client->osdc;
e8344e668915a7 majianpeng         2013-09-12  1511  	struct ceph_osd_reques=
t *req;
e8344e668915a7 majianpeng         2013-09-12  1512  	struct page **pages;
e8344e668915a7 majianpeng         2013-09-12  1513  	u64 len;
e8344e668915a7 majianpeng         2013-09-12  1514  	int num_pages;
e8344e668915a7 majianpeng         2013-09-12  1515  	int written =3D 0;
e8344e668915a7 majianpeng         2013-09-12  1516  	int ret;
efb0ca765ac6f4 Yan, Zheng         2017-05-22  1517  	bool check_caps =3D fa=
lse;
fac02ddf910814 Arnd Bergmann      2018-07-13  1518  	struct timespec64 mtim=
e =3D current_time(inode);
4908b822b300d2 Al Viro            2014-04-03  1519  	size_t count =3D iov_i=
ter_count(from);
e8344e668915a7 majianpeng         2013-09-12  1520  =

e8344e668915a7 majianpeng         2013-09-12  1521  	if (ceph_snap(file_ino=
de(file)) !=3D CEPH_NOSNAP)
e8344e668915a7 majianpeng         2013-09-12  1522  		return -EROFS;
e8344e668915a7 majianpeng         2013-09-12  1523  =

1c0a9c2d978360 Yan, Zheng         2017-08-16  1524  	dout("sync_write on fi=
le %p %lld~%u snapc %p seq %lld\n",
1c0a9c2d978360 Yan, Zheng         2017-08-16  1525  	     file, pos, (unsig=
ned)count, snapc, snapc->seq);
e8344e668915a7 majianpeng         2013-09-12  1526  =

e450f4d1a5d633 zhengbin           2019-02-01  1527  	ret =3D filemap_write_=
and_wait_range(inode->i_mapping,
e450f4d1a5d633 zhengbin           2019-02-01  1528  					   pos, pos + coun=
t - 1);
e8344e668915a7 majianpeng         2013-09-12  1529  	if (ret < 0)
e8344e668915a7 majianpeng         2013-09-12  1530  		return ret;
e8344e668915a7 majianpeng         2013-09-12  1531  =

400e1286c0ec3f Jeff Layton        2021-12-07  1532  	ceph_fscache_invalidat=
e(inode, false);
e8344e668915a7 majianpeng         2013-09-12  1533  	ret =3D invalidate_ino=
de_pages2_range(inode->i_mapping,
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1534  					    pos >> PAGE_SH=
IFT,
e450f4d1a5d633 zhengbin           2019-02-01  1535  					    (pos + count -=
 1) >> PAGE_SHIFT);
e8344e668915a7 majianpeng         2013-09-12  1536  	if (ret < 0)
e8344e668915a7 majianpeng         2013-09-12  1537  		dout("invalidate_inod=
e_pages2_range returned %d\n", ret);
e8344e668915a7 majianpeng         2013-09-12  1538  =

4908b822b300d2 Al Viro            2014-04-03  1539  	while ((len =3D iov_it=
er_count(from)) > 0) {
e8344e668915a7 majianpeng         2013-09-12  1540  		size_t left;
e8344e668915a7 majianpeng         2013-09-12  1541  		int n;
fcb8f573d11336 Jeff Layton        2021-01-27  1542  		u64 write_pos =3D pos;
fcb8f573d11336 Jeff Layton        2021-01-27  1543  		u64 write_len =3D len;
fcb8f573d11336 Jeff Layton        2021-01-27  1544  		u64 objnum, objoff;
fcb8f573d11336 Jeff Layton        2021-01-27  1545  		u32 xlen;
fcb8f573d11336 Jeff Layton        2021-01-27  1546  		u64 assert_ver;
fcb8f573d11336 Jeff Layton        2021-01-27  1547  		bool rmw;
fcb8f573d11336 Jeff Layton        2021-01-27  1548  		bool first, last;
fcb8f573d11336 Jeff Layton        2021-01-27  1549  		struct iov_iter saved=
_iter =3D *from;
fcb8f573d11336 Jeff Layton        2021-01-27  1550  		size_t off;
e8344e668915a7 majianpeng         2013-09-12  1551  =

fcb8f573d11336 Jeff Layton        2021-01-27  1552  		ceph_fscrypt_adjust_o=
ff_and_len(inode, &write_pos, &write_len);
fcb8f573d11336 Jeff Layton        2021-01-27  1553  =

fcb8f573d11336 Jeff Layton        2021-01-27  1554  		/* clamp the length t=
o the end of first object */
fcb8f573d11336 Jeff Layton        2021-01-27  1555  		ceph_calc_file_object=
_mapping(&ci->i_layout, write_pos,
fcb8f573d11336 Jeff Layton        2021-01-27  1556  						write_len, &objnu=
m, &objoff,
fcb8f573d11336 Jeff Layton        2021-01-27  1557  						&xlen);
fcb8f573d11336 Jeff Layton        2021-01-27  1558  		write_len =3D xlen;
fcb8f573d11336 Jeff Layton        2021-01-27  1559  =

fcb8f573d11336 Jeff Layton        2021-01-27  1560  		/* adjust len downwar=
d if it goes beyond current object */
fcb8f573d11336 Jeff Layton        2021-01-27  1561  		if (pos + len > write=
_pos + write_len)
fcb8f573d11336 Jeff Layton        2021-01-27  1562  			len =3D write_pos + =
write_len - pos;
fcb8f573d11336 Jeff Layton        2021-01-27  1563  =

fcb8f573d11336 Jeff Layton        2021-01-27  1564  		/*
fcb8f573d11336 Jeff Layton        2021-01-27  1565  		 * If we had to adjus=
t the length or position to align with a
fcb8f573d11336 Jeff Layton        2021-01-27  1566  		 * crypto block, then=
 we must do a read/modify/write cycle. We
fcb8f573d11336 Jeff Layton        2021-01-27  1567  		 * use a version asse=
rtion to redrive the thing if something
fcb8f573d11336 Jeff Layton        2021-01-27  1568  		 * changes in between.
fcb8f573d11336 Jeff Layton        2021-01-27  1569  		 */
fcb8f573d11336 Jeff Layton        2021-01-27  1570  		first =3D pos !=3D wr=
ite_pos;
fcb8f573d11336 Jeff Layton        2021-01-27  1571  		last =3D (pos + len) =
!=3D (write_pos + write_len);
fcb8f573d11336 Jeff Layton        2021-01-27  1572  		rmw =3D first || last;
fcb8f573d11336 Jeff Layton        2021-01-27  1573  =

fcb8f573d11336 Jeff Layton        2021-01-27  1574  		dout("sync_write ino =
%llx %lld~%llu adjusted %lld~%llu -- %srmw\n",
fcb8f573d11336 Jeff Layton        2021-01-27  1575  		     ci->i_vino.ino, =
pos, len, write_pos, write_len, rmw ? "" : "no ");
fcb8f573d11336 Jeff Layton        2021-01-27  1576  =

fcb8f573d11336 Jeff Layton        2021-01-27  1577  		/*
fcb8f573d11336 Jeff Layton        2021-01-27  1578  		 * The data is emplac=
ed into the page as it would be if it were in
fcb8f573d11336 Jeff Layton        2021-01-27  1579  		 * an array of pageca=
che pages.
fcb8f573d11336 Jeff Layton        2021-01-27  1580  		 */
fcb8f573d11336 Jeff Layton        2021-01-27  1581  		num_pages =3D calc_pa=
ges_for(write_pos, write_len);
fcb8f573d11336 Jeff Layton        2021-01-27  1582  		pages =3D ceph_alloc_=
page_vector(num_pages, GFP_KERNEL);
fcb8f573d11336 Jeff Layton        2021-01-27  1583  		if (IS_ERR(pages)) {
fcb8f573d11336 Jeff Layton        2021-01-27  1584  			ret =3D PTR_ERR(page=
s);
fcb8f573d11336 Jeff Layton        2021-01-27  1585  			break;
fcb8f573d11336 Jeff Layton        2021-01-27  1586  		}
fcb8f573d11336 Jeff Layton        2021-01-27  1587  =

fcb8f573d11336 Jeff Layton        2021-01-27  1588  		/* Do we need to prel=
oad the pages? */
fcb8f573d11336 Jeff Layton        2021-01-27  1589  		if (rmw) {
fcb8f573d11336 Jeff Layton        2021-01-27  1590  			u64 first_pos =3D wr=
ite_pos;
fcb8f573d11336 Jeff Layton        2021-01-27  1591  			u64 last_pos =3D (wr=
ite_pos + write_len) - CEPH_FSCRYPT_BLOCK_SIZE;
fcb8f573d11336 Jeff Layton        2021-01-27  1592  			u64 read_len =3D CEP=
H_FSCRYPT_BLOCK_SIZE;
fcb8f573d11336 Jeff Layton        2021-01-27  1593  =

fcb8f573d11336 Jeff Layton        2021-01-27  1594  			/* We should only ne=
ed to do this for encrypted inodes */
fcb8f573d11336 Jeff Layton        2021-01-27  1595  			WARN_ON_ONCE(!IS_ENC=
RYPTED(inode));
fcb8f573d11336 Jeff Layton        2021-01-27  1596  =

fcb8f573d11336 Jeff Layton        2021-01-27  1597  			/* No need to do two=
 reads if first and last blocks are same */
fcb8f573d11336 Jeff Layton        2021-01-27  1598  			if (first && last_po=
s =3D=3D first_pos)
fcb8f573d11336 Jeff Layton        2021-01-27  1599  				last =3D false;
fcb8f573d11336 Jeff Layton        2021-01-27  1600  =

fcb8f573d11336 Jeff Layton        2021-01-27  1601  			/*
fcb8f573d11336 Jeff Layton        2021-01-27  1602  			 * Allocate a read r=
equest for one or two extents, depending
fcb8f573d11336 Jeff Layton        2021-01-27  1603  			 * on how the reques=
t was aligned.
fcb8f573d11336 Jeff Layton        2021-01-27  1604  			 */
fcb8f573d11336 Jeff Layton        2021-01-27  1605  			req =3D ceph_osdc_ne=
w_request(osdc, &ci->i_layout,
fcb8f573d11336 Jeff Layton        2021-01-27  1606  					ci->i_vino, first =
? first_pos : last_pos,
fcb8f573d11336 Jeff Layton        2021-01-27  1607  					&read_len, 0, (fir=
st && last) ? 2 : 1,
fcb8f573d11336 Jeff Layton        2021-01-27  1608  					CEPH_OSD_OP_READ, =
CEPH_OSD_FLAG_READ,
fcb8f573d11336 Jeff Layton        2021-01-27  1609  					NULL, ci->i_trunca=
te_seq,
fcb8f573d11336 Jeff Layton        2021-01-27  1610  					ci->i_truncate_siz=
e, false);
e8344e668915a7 majianpeng         2013-09-12  1611  			if (IS_ERR(req)) {
fcb8f573d11336 Jeff Layton        2021-01-27  1612  				ceph_release_page_v=
ector(pages, num_pages);
e8344e668915a7 majianpeng         2013-09-12  1613  				ret =3D PTR_ERR(req=
);
eab87235c0f597 Al Viro            2014-04-03  1614  				break;
e8344e668915a7 majianpeng         2013-09-12  1615  			}
e8344e668915a7 majianpeng         2013-09-12  1616  =

fcb8f573d11336 Jeff Layton        2021-01-27  1617  			/* Something is misa=
ligned! */
fcb8f573d11336 Jeff Layton        2021-01-27  1618  			if (read_len !=3D CE=
PH_FSCRYPT_BLOCK_SIZE) {
fcb8f573d11336 Jeff Layton        2021-01-27  1619  				ceph_release_page_v=
ector(pages, num_pages);
fcb8f573d11336 Jeff Layton        2021-01-27  1620  				ret =3D -EIO;
fcb8f573d11336 Jeff Layton        2021-01-27  1621  				break;
fcb8f573d11336 Jeff Layton        2021-01-27  1622  			}
fcb8f573d11336 Jeff Layton        2021-01-27  1623  =

fcb8f573d11336 Jeff Layton        2021-01-27  1624  			/* Add extent for fi=
rst block? */
fcb8f573d11336 Jeff Layton        2021-01-27  1625  			if (first)
fcb8f573d11336 Jeff Layton        2021-01-27  1626  				osd_req_op_extent_o=
sd_data_pages(req, 0, pages,
fcb8f573d11336 Jeff Layton        2021-01-27  1627  							 CEPH_FSCRYPT_BL=
OCK_SIZE,
fcb8f573d11336 Jeff Layton        2021-01-27  1628  							 offset_in_page(=
first_pos),
fcb8f573d11336 Jeff Layton        2021-01-27  1629  							 false, false);
fcb8f573d11336 Jeff Layton        2021-01-27  1630  =

fcb8f573d11336 Jeff Layton        2021-01-27  1631  			/* Add extent for la=
st block */
fcb8f573d11336 Jeff Layton        2021-01-27  1632  			if (last) {
fcb8f573d11336 Jeff Layton        2021-01-27  1633  				/* Init the other e=
xtent if first extent has been used */
fcb8f573d11336 Jeff Layton        2021-01-27  1634  				if (first) {
fcb8f573d11336 Jeff Layton        2021-01-27  1635  					osd_req_op_extent_=
init(req, 1, CEPH_OSD_OP_READ,
fcb8f573d11336 Jeff Layton        2021-01-27  1636  							last_pos, CEPH_F=
SCRYPT_BLOCK_SIZE,
fcb8f573d11336 Jeff Layton        2021-01-27  1637  							ci->i_truncate_s=
ize,
fcb8f573d11336 Jeff Layton        2021-01-27  1638  							ci->i_truncate_s=
eq);
fcb8f573d11336 Jeff Layton        2021-01-27  1639  				}
fcb8f573d11336 Jeff Layton        2021-01-27  1640  =

fcb8f573d11336 Jeff Layton        2021-01-27  1641  				osd_req_op_extent_o=
sd_data_pages(req, first ? 1 : 0,
fcb8f573d11336 Jeff Layton        2021-01-27  1642  							&pages[num_pages=
 - 1],
fcb8f573d11336 Jeff Layton        2021-01-27  1643  							CEPH_FSCRYPT_BLO=
CK_SIZE,
fcb8f573d11336 Jeff Layton        2021-01-27  1644  							offset_in_page(l=
ast_pos),
fcb8f573d11336 Jeff Layton        2021-01-27  1645  							false, false);
fcb8f573d11336 Jeff Layton        2021-01-27  1646  			}
fcb8f573d11336 Jeff Layton        2021-01-27  1647  =

fcb8f573d11336 Jeff Layton        2021-01-27  1648  			ret =3D ceph_osdc_st=
art_request(osdc, req, false);
fcb8f573d11336 Jeff Layton        2021-01-27  1649  			if (!ret)
fcb8f573d11336 Jeff Layton        2021-01-27  1650  				ret =3D ceph_osdc_w=
ait_request(osdc, req);
fcb8f573d11336 Jeff Layton        2021-01-27  1651  =

fcb8f573d11336 Jeff Layton        2021-01-27  1652  			/* FIXME: length fie=
ld is wrong if there are 2 extents */
fcb8f573d11336 Jeff Layton        2021-01-27  1653  			ceph_update_read_met=
rics(&fsc->mdsc->metric,
fcb8f573d11336 Jeff Layton        2021-01-27  1654  						 req->r_start_lat=
ency,
fcb8f573d11336 Jeff Layton        2021-01-27  1655  						 req->r_end_laten=
cy,
fcb8f573d11336 Jeff Layton        2021-01-27  1656  						 read_len, ret);
fcb8f573d11336 Jeff Layton        2021-01-27  1657  =

fcb8f573d11336 Jeff Layton        2021-01-27  1658  			/* Ok if object is n=
ot already present */
fcb8f573d11336 Jeff Layton        2021-01-27  1659  			if (ret =3D=3D -ENOE=
NT) {
fcb8f573d11336 Jeff Layton        2021-01-27  1660  				/*
fcb8f573d11336 Jeff Layton        2021-01-27  1661  				 * If there is no o=
bject, then we can't assert
fcb8f573d11336 Jeff Layton        2021-01-27  1662  				 * on its version. =
Set it to 0, and we'll use an
fcb8f573d11336 Jeff Layton        2021-01-27  1663  				 * exclusive create=
 instead.
fcb8f573d11336 Jeff Layton        2021-01-27  1664  				 */
fcb8f573d11336 Jeff Layton        2021-01-27  1665  				ceph_osdc_put_reque=
st(req);
fcb8f573d11336 Jeff Layton        2021-01-27  1666  				assert_ver =3D 0;
fcb8f573d11336 Jeff Layton        2021-01-27  1667  				ret =3D 0;
fcb8f573d11336 Jeff Layton        2021-01-27  1668  =

fcb8f573d11336 Jeff Layton        2021-01-27  1669  				/*
fcb8f573d11336 Jeff Layton        2021-01-27  1670  				 * zero out the soo=
n-to-be uncopied parts of the
fcb8f573d11336 Jeff Layton        2021-01-27  1671  				 * first and last p=
ages.
fcb8f573d11336 Jeff Layton        2021-01-27  1672  				 */
fcb8f573d11336 Jeff Layton        2021-01-27  1673  				if (first)
fcb8f573d11336 Jeff Layton        2021-01-27  1674  					zero_user_segment(=
pages[0], 0,
fcb8f573d11336 Jeff Layton        2021-01-27  1675  							  offset_in_page=
(first_pos));
fcb8f573d11336 Jeff Layton        2021-01-27  1676  				if (last)
fcb8f573d11336 Jeff Layton        2021-01-27  1677  					zero_user_segment(=
pages[num_pages - 1],
fcb8f573d11336 Jeff Layton        2021-01-27  1678  							  offset_in_page=
(last_pos),
fcb8f573d11336 Jeff Layton        2021-01-27  1679  							  PAGE_SIZE);
fcb8f573d11336 Jeff Layton        2021-01-27  1680  			} else {
fcb8f573d11336 Jeff Layton        2021-01-27  1681  				/* Grab assert vers=
ion. It must be non-zero. */
fcb8f573d11336 Jeff Layton        2021-01-27  1682  				assert_ver =3D req-=
>r_version;
fcb8f573d11336 Jeff Layton        2021-01-27  1683  				WARN_ON_ONCE(ret > =
0 && assert_ver =3D=3D 0);
fcb8f573d11336 Jeff Layton        2021-01-27  1684  =

fcb8f573d11336 Jeff Layton        2021-01-27  1685  				ceph_osdc_put_reque=
st(req);
fcb8f573d11336 Jeff Layton        2021-01-27  1686  				if (ret < 0) {
fcb8f573d11336 Jeff Layton        2021-01-27  1687  					ceph_release_page_=
vector(pages, num_pages);
fcb8f573d11336 Jeff Layton        2021-01-27  1688  					break;
fcb8f573d11336 Jeff Layton        2021-01-27  1689  				}
fcb8f573d11336 Jeff Layton        2021-01-27  1690  =

fcb8f573d11336 Jeff Layton        2021-01-27  1691  				if (first) {
fcb8f573d11336 Jeff Layton        2021-01-27  1692  					ret =3D ceph_fscry=
pt_decrypt_block_inplace(inode,
fcb8f573d11336 Jeff Layton        2021-01-27  1693  							pages[0],
fcb8f573d11336 Jeff Layton        2021-01-27  1694  							CEPH_FSCRYPT_BLO=
CK_SIZE,
fcb8f573d11336 Jeff Layton        2021-01-27  1695  							offset_in_page(f=
irst_pos),
fcb8f573d11336 Jeff Layton        2021-01-27  1696  							first_pos >> CEP=
H_FSCRYPT_BLOCK_SHIFT);
fcb8f573d11336 Jeff Layton        2021-01-27  1697  					if (ret < 0) {
fcb8f573d11336 Jeff Layton        2021-01-27  1698  						ceph_release_page=
_vector(pages, num_pages);
fcb8f573d11336 Jeff Layton        2021-01-27  1699  						break;
fcb8f573d11336 Jeff Layton        2021-01-27  1700  					}
fcb8f573d11336 Jeff Layton        2021-01-27  1701  				}
fcb8f573d11336 Jeff Layton        2021-01-27  1702  				if (last) {
fcb8f573d11336 Jeff Layton        2021-01-27  1703  					ret =3D ceph_fscry=
pt_decrypt_block_inplace(inode,
fcb8f573d11336 Jeff Layton        2021-01-27  1704  							pages[num_pages =
- 1],
fcb8f573d11336 Jeff Layton        2021-01-27  1705  							CEPH_FSCRYPT_BLO=
CK_SIZE,
fcb8f573d11336 Jeff Layton        2021-01-27  1706  							offset_in_page(l=
ast_pos),
fcb8f573d11336 Jeff Layton        2021-01-27  1707  							last_pos >> CEPH=
_FSCRYPT_BLOCK_SHIFT);
fcb8f573d11336 Jeff Layton        2021-01-27  1708  					if (ret < 0) {
fcb8f573d11336 Jeff Layton        2021-01-27  1709  						ceph_release_page=
_vector(pages, num_pages);
fcb8f573d11336 Jeff Layton        2021-01-27  1710  						break;
fcb8f573d11336 Jeff Layton        2021-01-27  1711  					}
fcb8f573d11336 Jeff Layton        2021-01-27  1712  				}
fcb8f573d11336 Jeff Layton        2021-01-27  1713  			}
124e68e7409909 Sage Weil          2009-10-06  1714  		}
e8344e668915a7 majianpeng         2013-09-12  1715  =

e8344e668915a7 majianpeng         2013-09-12  1716  		left =3D len;
fcb8f573d11336 Jeff Layton        2021-01-27  1717  		off =3D offset_in_pag=
e(pos);
e8344e668915a7 majianpeng         2013-09-12  1718  		for (n =3D 0; n < num=
_pages; n++) {
fcb8f573d11336 Jeff Layton        2021-01-27  1719  			size_t plen =3D min_=
t(size_t, left, PAGE_SIZE - off);
fcb8f573d11336 Jeff Layton        2021-01-27  1720  =

fcb8f573d11336 Jeff Layton        2021-01-27  1721  			/* copy the data */
78035520582d1d Jeff Layton        2021-01-25  1722  			ret =3D copy_page_fr=
om_iter(pages[n], off, plen, from);
e8344e668915a7 majianpeng         2013-09-12  1723  			if (ret !=3D plen) {
e8344e668915a7 majianpeng         2013-09-12  1724  				ret =3D -EFAULT;
e8344e668915a7 majianpeng         2013-09-12  1725  				break;
e8344e668915a7 majianpeng         2013-09-12  1726  			}
fcb8f573d11336 Jeff Layton        2021-01-27  1727  			off =3D 0;
e8344e668915a7 majianpeng         2013-09-12  1728  			left -=3D ret;
e8344e668915a7 majianpeng         2013-09-12  1729  		}
fcb8f573d11336 Jeff Layton        2021-01-27  1730  		if (ret < 0) {
fcb8f573d11336 Jeff Layton        2021-01-27  1731  			dout("sync_write wri=
te failed with %d\n", ret);
fcb8f573d11336 Jeff Layton        2021-01-27  1732  			ceph_release_page_ve=
ctor(pages, num_pages);
fcb8f573d11336 Jeff Layton        2021-01-27  1733  			break;
fcb8f573d11336 Jeff Layton        2021-01-27  1734  		}
e8344e668915a7 majianpeng         2013-09-12  1735  =

fcb8f573d11336 Jeff Layton        2021-01-27  1736  		if (IS_ENCRYPTED(inod=
e)) {
fcb8f573d11336 Jeff Layton        2021-01-27  1737  			ret =3D ceph_fscrypt=
_encrypt_pages(inode, pages,
fcb8f573d11336 Jeff Layton        2021-01-27  1738  							 write_pos, writ=
e_len,
fcb8f573d11336 Jeff Layton        2021-01-27  1739  							 GFP_KERNEL);
124e68e7409909 Sage Weil          2009-10-06  1740  			if (ret < 0) {
fcb8f573d11336 Jeff Layton        2021-01-27  1741  				dout("encryption fa=
iled with %d\n", ret);
124e68e7409909 Sage Weil          2009-10-06  1742  				ceph_release_page_v=
ector(pages, num_pages);
fcb8f573d11336 Jeff Layton        2021-01-27  1743  				break;
fcb8f573d11336 Jeff Layton        2021-01-27  1744  			}
124e68e7409909 Sage Weil          2009-10-06  1745  		}
124e68e7409909 Sage Weil          2009-10-06  1746  =

fcb8f573d11336 Jeff Layton        2021-01-27  1747  		req =3D ceph_osdc_new=
_request(osdc, &ci->i_layout,
fcb8f573d11336 Jeff Layton        2021-01-27  1748  					    ci->i_vino, wr=
ite_pos, &write_len,
fcb8f573d11336 Jeff Layton        2021-01-27  1749  					    rmw ? 1 : 0, r=
mw ? 2 : 1,
fcb8f573d11336 Jeff Layton        2021-01-27  1750  					    CEPH_OSD_OP_WR=
ITE,
fcb8f573d11336 Jeff Layton        2021-01-27  1751  					    CEPH_OSD_FLAG_=
WRITE,
fcb8f573d11336 Jeff Layton        2021-01-27  1752  					    snapc, ci->i_t=
runcate_seq,
fcb8f573d11336 Jeff Layton        2021-01-27  1753  					    ci->i_truncate=
_size, false);
fcb8f573d11336 Jeff Layton        2021-01-27  1754  		if (IS_ERR(req)) {
fcb8f573d11336 Jeff Layton        2021-01-27  1755  			ret =3D PTR_ERR(req);
fcb8f573d11336 Jeff Layton        2021-01-27  1756  			ceph_release_page_ve=
ctor(pages, num_pages);
fcb8f573d11336 Jeff Layton        2021-01-27  1757  			break;
fcb8f573d11336 Jeff Layton        2021-01-27  1758  		}
fcb8f573d11336 Jeff Layton        2021-01-27  1759  =

fcb8f573d11336 Jeff Layton        2021-01-27  1760  		dout("sync_write writ=
e op %lld~%llu\n", write_pos, write_len);
fcb8f573d11336 Jeff Layton        2021-01-27  1761  		osd_req_op_extent_osd=
_data_pages(req, rmw ? 1 : 0, pages, write_len,
fcb8f573d11336 Jeff Layton        2021-01-27  1762  						 offset_in_page(w=
rite_pos), false,
fcb8f573d11336 Jeff Layton        2021-01-27  1763  						 true);
26be88087ae8a0 Alex Elder         2013-04-15  1764  		req->r_inode =3D inod=
e;
fcb8f573d11336 Jeff Layton        2021-01-27  1765  		req->r_mtime =3D mtim=
e;
e8344e668915a7 majianpeng         2013-09-12  1766  =

fcb8f573d11336 Jeff Layton        2021-01-27  1767  		/* Set up the asserti=
on */
fcb8f573d11336 Jeff Layton        2021-01-27  1768  		if (rmw) {
fcb8f573d11336 Jeff Layton        2021-01-27  1769  			/*
fcb8f573d11336 Jeff Layton        2021-01-27  1770  			 * Set up the assert=
ion. If we don't have a version number,
fcb8f573d11336 Jeff Layton        2021-01-27  1771  			 * then the object d=
oesn't exist yet. Use an exclusive create
fcb8f573d11336 Jeff Layton        2021-01-27  1772  			 * instead of a vers=
ion assertion in that case.
fcb8f573d11336 Jeff Layton        2021-01-27  1773  			 */
fcb8f573d11336 Jeff Layton        2021-01-27  1774  			if (assert_ver) {
fcb8f573d11336 Jeff Layton        2021-01-27  1775  				osd_req_op_init(req=
, 0, CEPH_OSD_OP_ASSERT_VER, 0);
fcb8f573d11336 Jeff Layton        2021-01-27  1776  				req->r_ops[0].asser=
t_ver.ver =3D assert_ver;
fcb8f573d11336 Jeff Layton        2021-01-27  1777  			} else {
fcb8f573d11336 Jeff Layton        2021-01-27  1778  				osd_req_op_init(req=
, 0, CEPH_OSD_OP_CREATE,
fcb8f573d11336 Jeff Layton        2021-01-27  1779  						CEPH_OSD_OP_FLAG_=
EXCL);
fcb8f573d11336 Jeff Layton        2021-01-27  1780  			}
fcb8f573d11336 Jeff Layton        2021-01-27  1781  		}
124e68e7409909 Sage Weil          2009-10-06  1782  =

fcb8f573d11336 Jeff Layton        2021-01-27  1783  		ret =3D ceph_osdc_sta=
rt_request(osdc, req, false);
26be88087ae8a0 Alex Elder         2013-04-15  1784  		if (!ret)
fcb8f573d11336 Jeff Layton        2021-01-27  1785  			ret =3D ceph_osdc_wa=
it_request(osdc, req);
124e68e7409909 Sage Weil          2009-10-06  1786  =

8ae99ae2b40766 Xiubo Li           2021-03-22  1787  		ceph_update_write_met=
rics(&fsc->mdsc->metric, req->r_start_latency,
903f4fec78dd05 Xiubo Li           2021-05-13  1788  					  req->r_end_laten=
cy, len, ret);
124e68e7409909 Sage Weil          2009-10-06  1789  		ceph_osdc_put_request=
(req);
26544c623e741a Jeff Layton        2017-04-04  1790  		if (ret !=3D 0) {
fcb8f573d11336 Jeff Layton        2021-01-27  1791  			dout("sync_write osd=
 write returned %d\n", ret);
fcb8f573d11336 Jeff Layton        2021-01-27  1792  			/* Version changed! =
Must re-do the rmw cycle */
fcb8f573d11336 Jeff Layton        2021-01-27 @1793  			if ((assert_ver && (=
ret =3D=3D -ERANGE || ret =3D=3D -EOVERFLOW)) ||
fcb8f573d11336 Jeff Layton        2021-01-27  1794  			     (!assert_ver &&=
 ret =3D=3D -EEXIST)) {
fcb8f573d11336 Jeff Layton        2021-01-27  1795  				/* We should only e=
ver see this on a rmw */
fcb8f573d11336 Jeff Layton        2021-01-27  1796  				WARN_ON_ONCE(!rmw);
fcb8f573d11336 Jeff Layton        2021-01-27  1797  =

fcb8f573d11336 Jeff Layton        2021-01-27  1798  				/* The version shou=
ld never go backward */
fcb8f573d11336 Jeff Layton        2021-01-27  1799  				WARN_ON_ONCE(ret =
=3D=3D -EOVERFLOW);
fcb8f573d11336 Jeff Layton        2021-01-27  1800  =

fcb8f573d11336 Jeff Layton        2021-01-27  1801  				*from =3D saved_ite=
r;
fcb8f573d11336 Jeff Layton        2021-01-27  1802  =

fcb8f573d11336 Jeff Layton        2021-01-27  1803  				/* FIXME: limit num=
ber of times we loop? */
fcb8f573d11336 Jeff Layton        2021-01-27  1804  				continue;
fcb8f573d11336 Jeff Layton        2021-01-27  1805  			}
26544c623e741a Jeff Layton        2017-04-04  1806  			ceph_set_error_write=
(ci);
26544c623e741a Jeff Layton        2017-04-04  1807  			break;
26544c623e741a Jeff Layton        2017-04-04  1808  		}
26544c623e741a Jeff Layton        2017-04-04  1809  		ceph_clear_error_writ=
e(ci);
124e68e7409909 Sage Weil          2009-10-06  1810  		pos +=3D len;
124e68e7409909 Sage Weil          2009-10-06  1811  		written +=3D len;
fcb8f573d11336 Jeff Layton        2021-01-27  1812  		dout("sync_write writ=
ten %d\n", written);
e8344e668915a7 majianpeng         2013-09-12  1813  		if (pos > i_size_read=
(inode)) {
124e68e7409909 Sage Weil          2009-10-06  1814  			check_caps =3D ceph_=
inode_set_size(inode, pos);
124e68e7409909 Sage Weil          2009-10-06  1815  			if (check_caps)
e8344e668915a7 majianpeng         2013-09-12  1816  				ceph_check_caps(cep=
h_inode(inode),
e8344e668915a7 majianpeng         2013-09-12  1817  						CHECK_CAPS_AUTHON=
LY,
124e68e7409909 Sage Weil          2009-10-06  1818  						NULL);
e8344e668915a7 majianpeng         2013-09-12  1819  		}
26544c623e741a Jeff Layton        2017-04-04  1820  =

e8344e668915a7 majianpeng         2013-09-12  1821  	}
e8344e668915a7 majianpeng         2013-09-12  1822  =

e8344e668915a7 majianpeng         2013-09-12  1823  	if (ret !=3D -EOLDSNAP=
C && written > 0) {
ee7289bfadda5f majianpeng         2013-08-21  1824  		ret =3D written;
e8344e668915a7 majianpeng         2013-09-12  1825  		iocb->ki_pos =3D pos;
124e68e7409909 Sage Weil          2009-10-06  1826  	}
fcb8f573d11336 Jeff Layton        2021-01-27  1827  	dout("sync_write retur=
ning %d\n", ret);
124e68e7409909 Sage Weil          2009-10-06  1828  	return ret;
124e68e7409909 Sage Weil          2009-10-06  1829  }
124e68e7409909 Sage Weil          2009-10-06  1830  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5472773439706597549==--


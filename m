Content-Type: multipart/mixed; boundary="===============0975211939951041151=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/xen/swiotlb-xen.c:206:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Thu, 30 Dec 2021 03:32:35 +0800
Message-ID: <202112300339.Mdr4nwDf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0975211939951041151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e7c124bd04631973a3cc0df19ab881b56d8a2d50
commit: cbce99527ca7c4e98db9890651d5e9dfc2fb89ac xen-swiotlb: remove xen_io=
_tlb_start and xen_io_tlb_nslabs
date:   10 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20211228 (https://download.01.org/0day-ci/archi=
ve/20211230/202112300339.Mdr4nwDf-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af=
744543433ac75b232eb7dfdaef7efd4d7a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcbce99527ca7c4e98db9890651d5e9dfc2fb89ac
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cbce99527ca7c4e98db9890651d5e9dfc2fb89ac
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (timeout)
               ^~~~~~~
   fs/io_uring.c:6125:2: note: Taking true branch
           if (timeout)
           ^
   fs/io_uring.c:6128:6: note: Assuming the condition is false
           if (work->flags & IO_WQ_WORK_CANCEL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:6128:2: note: Taking false branch
           if (work->flags & IO_WQ_WORK_CANCEL)
           ^
   fs/io_uring.c:6131:7: note: 'ret' is 0
           if (!ret) {
                ^~~
   fs/io_uring.c:6131:2: note: Taking true branch
           if (!ret) {
           ^
   fs/io_uring.c:6133:10: note: Calling 'io_issue_sqe'
                           ret =3D io_issue_sqe(req, 0);
                                 ^~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:5986:6: note: Assuming field 'creds' is null
           if (req->work.creds && req->work.creds !=3D current_cred())
               ^~~~~~~~~~~~~~~
   fs/io_uring.c:5986:22: note: Left side of '&&' is false
           if (req->work.creds && req->work.creds !=3D current_cred())
                               ^
   fs/io_uring.c:5989:2: note: Control jumps to 'case IORING_OP_WRITEV:'  a=
t line 5998
           switch (req->opcode) {
           ^
   fs/io_uring.c:6001:9: note: Calling 'io_write'
                   ret =3D io_write(req, issue_flags);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:3337:6: note: Assuming 'rw' is null
           if (rw) {
               ^~
   fs/io_uring.c:3337:2: note: Taking false branch
           if (rw) {
           ^
   fs/io_uring.c:3341:9: note: Calling 'io_import_iovec'
                   ret =3D io_import_iovec(WRITE, req, &iovec, iter, !force=
_nonblock);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   fs/io_uring.c:2961:6: note: 'opcode' is not equal to IORING_OP_READ_FIXED
           if (opcode =3D=3D IORING_OP_READ_FIXED || opcode =3D=3D IORING_O=
P_WRITE_FIXED) {
               ^~~~~~
   fs/io_uring.c:2961:6: note: Left side of '||' is false
   fs/io_uring.c:2961:40: note: 'opcode' is not equal to IORING_OP_WRITE_FI=
XED
           if (opcode =3D=3D IORING_OP_READ_FIXED || opcode =3D=3D IORING_O=
P_WRITE_FIXED) {
                                                 ^~~~~~
   fs/io_uring.c:2961:2: note: Taking false branch
           if (opcode =3D=3D IORING_OP_READ_FIXED || opcode =3D=3D IORING_O=
P_WRITE_FIXED) {
           ^
   fs/io_uring.c:2967:6: note: Assuming field 'buf_index' is 0
           if (req->buf_index && !(req->flags & REQ_F_BUFFER_SELECT))
               ^~~~~~~~~~~~~~
   fs/io_uring.c:2967:21: note: Left side of '&&' is false
           if (req->buf_index && !(req->flags & REQ_F_BUFFER_SELECT))
                              ^
   fs/io_uring.c:2970:6: note: 'opcode' is not equal to IORING_OP_READ
           if (opcode =3D=3D IORING_OP_READ || opcode =3D=3D IORING_OP_WRIT=
E) {
               ^~~~~~
   fs/io_uring.c:2970:6: note: Left side of '||' is false
   fs/io_uring.c:2970:34: note: 'opcode' is not equal to IORING_OP_WRITE
           if (opcode =3D=3D IORING_OP_READ || opcode =3D=3D IORING_OP_WRIT=
E) {
                                           ^~~~~~
   fs/io_uring.c:2970:2: note: Taking false branch
           if (opcode =3D=3D IORING_OP_READ || opcode =3D=3D IORING_OP_WRIT=
E) {
           ^
   fs/io_uring.c:2983:6: note: Assuming the condition is true
           if (req->flags & REQ_F_BUFFER_SELECT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:2983:2: note: Taking true branch
           if (req->flags & REQ_F_BUFFER_SELECT) {
           ^
   fs/io_uring.c:2985:7: note: Assuming 'ret' is not equal to 0
                   if (!ret)
                       ^~~~
   fs/io_uring.c:2985:3: note: Taking false branch
                   if (!ret)
                   ^
   fs/io_uring.c:2988:3: note: Returning without writing to 'iter->count'
                   return ret;
                   ^
   fs/io_uring.c:3341:9: note: Returning from 'io_import_iovec'
                   ret =3D io_import_iovec(WRITE, req, &iovec, iter, !force=
_nonblock);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   fs/io_uring.c:3342:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   fs/io_uring.c:3342:3: note: Taking false branch
                   if (ret < 0)
                   ^
   fs/io_uring.c:3345:12: note: Calling 'iov_iter_count'
           io_size =3D iov_iter_count(iter);
                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/uio.h:234:2: note: Undefined or garbage value returned to =
caller
           return i->count;
           ^      ~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
>> drivers/xen/swiotlb-xen.c:206:6: warning: Branch condition evaluates to =
a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!start) {
               ^~~~~~
   drivers/xen/swiotlb-xen.c:165:2: note: 'start' declared without an initi=
al value
           char *start;
           ^~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:170:6: note: Assuming 'nslabs' is 0
           if (!nslabs)
               ^~~~~~~
   drivers/xen/swiotlb-xen.c:170:2: note: Taking true branch
           if (!nslabs)
           ^
   drivers/xen/swiotlb-xen.c:178:6: note: Assuming 'io_tlb_start' is equal =
to 0
           if (io_tlb_start !=3D 0)
               ^~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:178:2: note: Taking false branch
           if (io_tlb_start !=3D 0)
           ^
   drivers/xen/swiotlb-xen.c:184:6: note: Assuming 'early' is false
           if (early) {
               ^~~~~
   drivers/xen/swiotlb-xen.c:184:2: note: Taking false branch
           if (early) {
           ^
   drivers/xen/swiotlb-xen.c:193:10: note: Assuming the condition is false
                   while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:193:3: note: Loop condition is false. Executio=
n continues on line 199
                   while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
                   ^
   drivers/xen/swiotlb-xen.c:199:7: note: Assuming the condition is false
                   if (order !=3D get_order(bytes)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:199:3: note: Taking false branch
                   if (order !=3D get_order(bytes)) {
                   ^
   drivers/xen/swiotlb-xen.c:206:6: note: Branch condition evaluates to a g=
arbage value
           if (!start) {
               ^~~~~~
   Suppressed 17 warnings (15 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/xen/privcmd.c:94:2: warning: Assigned value is garbage or undefi=
ned [clang-analyzer-core.uninitialized.Assign]
           list_for_each_entry_safe(p, n, pages, lru)
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:708:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^
   drivers/xen/privcmd.c:841:2: note: Control jumps to 'case 806914:'  at l=
ine 846
           switch (cmd) {
           ^
   drivers/xen/privcmd.c:847:9: note: Calling 'privcmd_ioctl_mmap'
                   ret =3D privcmd_ioctl_mmap(file, udata);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:261:6: note: Assuming the condition is false
           if (xen_feature(XENFEAT_auto_translated_physmap))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:261:2: note: Taking false branch
           if (xen_feature(XENFEAT_auto_translated_physmap))
           ^
   drivers/xen/privcmd.c:264:2: note: Taking false branch
           if (copy_from_user(&mmapcmd, udata, sizeof(mmapcmd)))
           ^
   drivers/xen/privcmd.c:268:6: note: Assuming field 'domid' is equal to DO=
MID_INVALID
           if (data->domid !=3D DOMID_INVALID && data->domid !=3D mmapcmd.d=
om)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:268:35: note: Left side of '&&' is false
           if (data->domid !=3D DOMID_INVALID && data->domid !=3D mmapcmd.d=
om)
                                            ^
   drivers/xen/privcmd.c:271:7: note: Calling 'gather_array'
           rc =3D gather_array(&pagelist,
                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:114:2: note: Taking false branch
           if (size > PAGE_SIZE)
           ^
   drivers/xen/privcmd.c:119:2: note: Loop condition is false. Execution co=
ntinues on line 141
           while (nelem--) {
           ^
   drivers/xen/privcmd.c:271:7: note: Returning from 'gather_array'
           rc =3D gather_array(&pagelist,
                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:275:6: note: 'rc' is 0
           if (rc || list_empty(&pagelist))
               ^~
   drivers/xen/privcmd.c:275:6: note: Left side of '||' is false
   drivers/xen/privcmd.c:275:2: note: Taking true branch
           if (rc || list_empty(&pagelist))
           ^
   drivers/xen/privcmd.c:276:3: note: Control jumps to line 306
                   goto out;
                   ^
   drivers/xen/privcmd.c:306:2: note: Calling 'free_page_list'

vim +206 drivers/xen/swiotlb-xen.c

4035b43da6daa5 Christoph Hellwig     2021-03-01  158  =

b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  159  int __ref xen_swiotlb=
_init(int verbose, bool early)
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  160  {
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  161  	unsigned long bytes,=
 order;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  162  	int rc =3D -ENOMEM;
5bab7864b1167f Konrad Rzeszutek Wilk 2012-08-23  163  	enum xen_swiotlb_err=
 m_ret =3D XEN_SWIOTLB_UNKNOWN;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  164  	unsigned int repeat =
=3D 3;
cbce99527ca7c4 Christoph Hellwig     2021-03-01  165  	char *start;
cbce99527ca7c4 Christoph Hellwig     2021-03-01  166  	unsigned long nslabs;
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  167  =

cbce99527ca7c4 Christoph Hellwig     2021-03-01  168  	nslabs =3D swiotlb_n=
r_tbl();
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  169  retry:
cbce99527ca7c4 Christoph Hellwig     2021-03-01  170  	if (!nslabs)
cbce99527ca7c4 Christoph Hellwig     2021-03-01  171  		nslabs =3D DEFAULT_=
NSLABS;
cbce99527ca7c4 Christoph Hellwig     2021-03-01  172  	bytes =3D nslabs << =
IO_TLB_SHIFT;
4035b43da6daa5 Christoph Hellwig     2021-03-01  173  	order =3D get_order(=
bytes);
4e7372e0dc5d7d Stefano Stabellini    2019-05-28  174  =

4e7372e0dc5d7d Stefano Stabellini    2019-05-28  175  	/*
4e7372e0dc5d7d Stefano Stabellini    2019-05-28  176  	 * IO TLB memory alr=
eady allocated. Just use it.
4e7372e0dc5d7d Stefano Stabellini    2019-05-28  177  	 */
cbce99527ca7c4 Christoph Hellwig     2021-03-01  178  	if (io_tlb_start !=
=3D 0)
4e7372e0dc5d7d Stefano Stabellini    2019-05-28  179  		goto end;
4e7372e0dc5d7d Stefano Stabellini    2019-05-28  180  =

b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  181  	/*
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  182  	 * Get IO TLB memory=
 from any location.
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  183  	 */
8a7f97b902f4fb Mike Rapoport         2019-03-11  184  	if (early) {
cbce99527ca7c4 Christoph Hellwig     2021-03-01  185  		start =3D memblock_=
alloc(PAGE_ALIGN(bytes),
15c3c114ed144e Mike Rapoport         2018-10-30  186  						  PAGE_SIZE);
cbce99527ca7c4 Christoph Hellwig     2021-03-01  187  		if (!start)
8a7f97b902f4fb Mike Rapoport         2019-03-11  188  			panic("%s: Failed =
to allocate %lu bytes align=3D0x%lx\n",
8a7f97b902f4fb Mike Rapoport         2019-03-11  189  			      __func__, PA=
GE_ALIGN(bytes), PAGE_SIZE);
8a7f97b902f4fb Mike Rapoport         2019-03-11  190  	} else {
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  191  #define SLABS_PER_PAG=
E (1 << (PAGE_SHIFT - IO_TLB_SHIFT))
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  192  #define IO_TLB_MIN_SL=
ABS ((1<<20) >> IO_TLB_SHIFT)
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  193  		while ((SLABS_PER_P=
AGE << order) > IO_TLB_MIN_SLABS) {
cbce99527ca7c4 Christoph Hellwig     2021-03-01  194  			start =3D (void *)=
xen_get_swiotlb_free_pages(order);
cbce99527ca7c4 Christoph Hellwig     2021-03-01  195  			if (start)
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  196  				break;
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  197  			order--;
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  198  		}
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  199  		if (order !=3D get_=
order(bytes)) {
283c0972d53769 Joe Perches           2013-06-28  200  			pr_warn("Warning: =
only able to allocate %ld MB for software IO TLB\n",
283c0972d53769 Joe Perches           2013-06-28  201  				(PAGE_SIZE << ord=
er) >> 20);
cbce99527ca7c4 Christoph Hellwig     2021-03-01  202  			nslabs =3D SLABS_P=
ER_PAGE << order;
cbce99527ca7c4 Christoph Hellwig     2021-03-01  203  			bytes =3D nslabs <=
< IO_TLB_SHIFT;
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  204  		}
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  205  	}
cbce99527ca7c4 Christoph Hellwig     2021-03-01 @206  	if (!start) {
5bab7864b1167f Konrad Rzeszutek Wilk 2012-08-23  207  		m_ret =3D XEN_SWIOT=
LB_ENOMEM;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  208  		goto error;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  209  	}
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  210  	/*
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  211  	 * And replace that =
memory with pages under 4GB.
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  212  	 */
cbce99527ca7c4 Christoph Hellwig     2021-03-01  213  	rc =3D xen_swiotlb_f=
ixup(start,
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  214  			       bytes,
cbce99527ca7c4 Christoph Hellwig     2021-03-01  215  			       nslabs);
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  216  	if (rc) {
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  217  		if (early)
cbce99527ca7c4 Christoph Hellwig     2021-03-01  218  			memblock_free(__pa=
(start),
2013288f723887 Mike Rapoport         2018-10-30  219  				      PAGE_ALIGN(=
bytes));
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  220  		else {
cbce99527ca7c4 Christoph Hellwig     2021-03-01  221  			free_pages((unsign=
ed long)start, order);
cbce99527ca7c4 Christoph Hellwig     2021-03-01  222  			start =3D NULL;
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  223  		}
5bab7864b1167f Konrad Rzeszutek Wilk 2012-08-23  224  		m_ret =3D XEN_SWIOT=
LB_EFIXUP;
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  225  		goto error;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  226  	}
c468bdee28a1cb Konrad Rzeszutek Wilk 2012-09-17  227  	if (early) {
cbce99527ca7c4 Christoph Hellwig     2021-03-01  228  		if (swiotlb_init_wi=
th_tbl(start, nslabs,
ac2cbab21f318e Yinghai Lu            2013-01-24  229  			 verbose))
ac2cbab21f318e Yinghai Lu            2013-01-24  230  			panic("Cannot allo=
cate SWIOTLB buffer");
c468bdee28a1cb Konrad Rzeszutek Wilk 2012-09-17  231  		rc =3D 0;
c468bdee28a1cb Konrad Rzeszutek Wilk 2012-09-17  232  	} else
cbce99527ca7c4 Christoph Hellwig     2021-03-01  233  		rc =3D swiotlb_late=
_init_with_tbl(start, nslabs);
7453c549f5f648 Konrad Rzeszutek Wilk 2016-12-20  234  =

4e7372e0dc5d7d Stefano Stabellini    2019-05-28  235  end:
7453c549f5f648 Konrad Rzeszutek Wilk 2016-12-20  236  	if (!rc)
7453c549f5f648 Konrad Rzeszutek Wilk 2016-12-20  237  		swiotlb_set_max_seg=
ment(PAGE_SIZE);
7453c549f5f648 Konrad Rzeszutek Wilk 2016-12-20  238  =

b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  239  	return rc;
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  240  error:
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  241  	if (repeat--) {
cbce99527ca7c4 Christoph Hellwig     2021-03-01  242  		nslabs =3D max(1024=
UL, /* Min is 2MB */
cbce99527ca7c4 Christoph Hellwig     2021-03-01  243  					(nslabs >> 1));
283c0972d53769 Joe Perches           2013-06-28  244  		pr_info("Lowering t=
o %luMB\n",
cbce99527ca7c4 Christoph Hellwig     2021-03-01  245  			(nslabs << IO_TLB_=
SHIFT) >> 20);
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  246  		goto retry;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  247  	}
283c0972d53769 Joe Perches           2013-06-28  248  	pr_err("%s (rc:%d)\n=
", xen_swiotlb_error(m_ret), rc);
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  249  	if (early)
5bab7864b1167f Konrad Rzeszutek Wilk 2012-08-23  250  		panic("%s (rc:%d)",=
 xen_swiotlb_error(m_ret), rc);
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  251  	else
cbce99527ca7c4 Christoph Hellwig     2021-03-01  252  		free_pages((unsigne=
d long)start, order);
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  253  	return rc;
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  254  }
dceb1a6819ab2c Christoph Hellwig     2017-05-21  255  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0975211939951041151==--


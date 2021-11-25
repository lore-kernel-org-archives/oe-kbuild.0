Content-Type: multipart/mixed; boundary="===============7327541011646214741=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/filemap.c:2371:7: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Fri, 26 Nov 2021 04:29:42 +0800
Message-ID: <202111260432.WwFGTv63-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7327541011646214741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Kent Overstreet <kmo@daterainc.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5f53fa508db098c9d372423a6dac31c8a5679cdf
commit: aa1ec2f69780c5b9590143162101b6dc3dc1de5f mm/filemap: don't relock t=
he page after calling readpage
date:   9 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20211011 (https://download.01.org/0day-ci/archi=
ve/20211126/202111260432.WwFGTv63-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 903b30=
fea21f99d8f48fde4defcc838970e30ee1)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Daa1ec2f69780c5b9590143162101b6dc3dc1de5f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout aa1ec2f69780c5b9590143162101b6dc3dc1de5f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
             ^
   drivers/gpio/gpiolib-cdev.c:202:13: note: '?' condition is true
           if (cmd =3D=3D GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
                      ^
   include/uapi/linux/gpio.h:523:42: note: expanded from macro 'GPIOHANDLE_=
GET_LINE_VALUES_IOCTL'
   #define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpioha=
ndle_data)
                                            ^
   include/uapi/asm-generic/ioctl.h:88:68: note: expanded from macro '_IOWR'
   #define _IOWR(type,nr,size)     _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),(_=
IOC_TYPECHECK(size)))
                                                                          ^
   include/asm-generic/ioctl.h:13:3: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
            ^
   drivers/gpio/gpiolib-cdev.c:202:6: note: Assuming the condition is false
           if (cmd =3D=3D GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:202:2: note: Taking false branch
           if (cmd =3D=3D GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
           ^
   drivers/gpio/gpiolib-cdev.c:221:20: note: Left side of '&&' is true
           } else if (cmd =3D=3D GPIOHANDLE_SET_LINE_VALUES_IOCTL) {
                             ^
   include/uapi/linux/gpio.h:524:42: note: expanded from macro 'GPIOHANDLE_=
SET_LINE_VALUES_IOCTL'
   #define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpioha=
ndle_data)
                                            ^
   include/uapi/asm-generic/ioctl.h:88:68: note: expanded from macro '_IOWR'
   #define _IOWR(type,nr,size)     _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),(_=
IOC_TYPECHECK(size)))
                                                                          ^
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
             ^
   drivers/gpio/gpiolib-cdev.c:221:20: note: '?' condition is true
           } else if (cmd =3D=3D GPIOHANDLE_SET_LINE_VALUES_IOCTL) {
                             ^
   include/uapi/linux/gpio.h:524:42: note: expanded from macro 'GPIOHANDLE_=
SET_LINE_VALUES_IOCTL'
   #define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpioha=
ndle_data)
                                            ^
   include/uapi/asm-generic/ioctl.h:88:68: note: expanded from macro '_IOWR'
   #define _IOWR(type,nr,size)     _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),(_=
IOC_TYPECHECK(size)))
                                                                          ^
   include/asm-generic/ioctl.h:13:3: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
            ^
   drivers/gpio/gpiolib-cdev.c:221:13: note: Assuming the condition is true
           } else if (cmd =3D=3D GPIOHANDLE_SET_LINE_VALUES_IOCTL) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:221:9: note: Taking true branch
           } else if (cmd =3D=3D GPIOHANDLE_SET_LINE_VALUES_IOCTL) {
                  ^
   drivers/gpio/gpiolib-cdev.c:226:7: note: Assuming the condition is false
                   if (!test_bit(FLAG_IS_OUT, &lh->descs[0]->flags))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:226:3: note: Taking false branch
                   if (!test_bit(FLAG_IS_OUT, &lh->descs[0]->flags))
                   ^
   drivers/gpio/gpiolib-cdev.c:229:3: note: Taking false branch
                   if (copy_from_user(&ghd, ip, sizeof(ghd)))
                   ^
   drivers/gpio/gpiolib-cdev.c:233:15: note: Assuming 'i' is < field 'num_d=
escs'
                   for (i =3D 0; i < lh->num_descs; i++)
                               ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:233:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (i =3D 0; i < lh->num_descs; i++)
                   ^
   drivers/gpio/gpiolib-cdev.c:234:4: note: Calling '__assign_bit'
                           __assign_bit(i, vals, ghd.values[i]);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:250:6: note: Assuming 'value' is false
           if (value)
               ^~~~~
   include/linux/bitops.h:250:2: note: Taking false branch
           if (value)
           ^
   include/linux/bitops.h:253:3: note: Calling '__clear_bit'
                   __clear_bit(nr, addr);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:29:5: note: The left expression =
of the compound assignment is an uninitialized value. The computed value wi=
ll also be garbage
           *p &=3D ~mask;
           ~~ ^
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> mm/filemap.c:2371:7: warning: Assigned value is garbage or undefined [cl=
ang-analyzer-core.uninitialized.Assign]
           page =3D pvec->pages[pagevec_count(pvec) - 1];
                ^
   mm/filemap.c:2548:6: note: Assuming 'count' is not equal to 0
           if (!count)
               ^~~~~~
   mm/filemap.c:2548:2: note: Taking false branch
           if (!count)
           ^
   mm/filemap.c:2551:6: note: Assuming the condition is false
           if (iocb->ki_flags & IOCB_DIRECT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/filemap.c:2551:2: note: Taking false branch
           if (iocb->ki_flags & IOCB_DIRECT) {
           ^
   mm/filemap.c:2594:11: note: Calling 'generic_file_buffered_read'
           retval =3D generic_file_buffered_read(iocb, iter, retval);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/filemap.c:2424:15: note: Assuming field 'ki_pos' is < field 's_maxbyt=
es'
           if (unlikely(iocb->ki_pos >=3D inode->i_sb->s_maxbytes))
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   mm/filemap.c:2424:21: note: Field 'ki_pos' is < field 's_maxbytes'
           if (unlikely(iocb->ki_pos >=3D inode->i_sb->s_maxbytes))
                              ^
   mm/filemap.c:2424:2: note: Taking false branch
           if (unlikely(iocb->ki_pos >=3D inode->i_sb->s_maxbytes))
           ^
   mm/filemap.c:2426:2: note: Taking false branch
           if (unlikely(!iov_iter_count(iter)))
           ^
   mm/filemap.c:2430:2: note: Calling 'pagevec_init'
           pagevec_init(&pvec);
           ^~~~~~~~~~~~~~~~~~~
   mm/filemap.c:2430:2: note: Returning from 'pagevec_init'
           pagevec_init(&pvec);
           ^~~~~~~~~~~~~~~~~~~
   mm/filemap.c:2440:8: note: Assuming the condition is false
                   if ((iocb->ki_flags & IOCB_WAITQ) && written)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/filemap.c:2440:37: note: Left side of '&&' is false
                   if ((iocb->ki_flags & IOCB_WAITQ) && written)
                                                     ^
   mm/filemap.c:2443:11: note: Calling 'filemap_get_pages'
                   error =3D filemap_get_pages(iocb, iter, &pvec);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/filemap.c:2350:6: note: Calling 'fatal_signal_pending'
           if (fatal_signal_pending(current))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched/signal.h:381:28: note: Left side of '&&' is false
           return task_sigpending(p) && __fatal_signal_pending(p);
                                     ^
   include/linux/sched/signal.h:381:2: note: Returning zero, which particip=
ates in a condition later
           return task_sigpending(p) && __fatal_signal_pending(p);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/filemap.c:2350:6: note: Returning from 'fatal_signal_pending'
           if (fatal_signal_pending(current))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/filemap.c:2350:2: note: Taking false branch
           if (fatal_signal_pending(current))
           ^
   mm/filemap.c:2353:2: note: Calling 'filemap_get_read_batch'
           filemap_get_read_batch(mapping, index, last_index, pvec);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/filemap.c:2173:2: note: Loop condition is true.  Entering loop body
           for (head =3D xas_load(&xas); head; head =3D xas_next(&xas)) {
           ^
   mm/filemap.c:2174:3: note: Taking false branch
                   if (xas_retry(&xas, head))
                   ^
   mm/filemap.c:2176:7: note: Assuming 'max' is >=3D field 'xa_index'
                   if (xas.xa_index > max || xa_is_value(head))
                       ^~~~~~~~~~~~~~~~~~
   mm/filemap.c:2176:7: note: Left side of '||' is false
   mm/filemap.c:2176:29: note: Assuming the condition is false
                   if (xas.xa_index > max || xa_is_value(head))
                                             ^~~~~~~~~~~~~~~~~
   mm/filemap.c:2176:3: note: Taking false branch
                   if (xas.xa_index > max || xa_is_value(head))
                   ^
   mm/filemap.c:2178:3: note: Taking false branch
                   if (!page_cache_get_speculative(head))
                   ^
   mm/filemap.c:2182:16: note: Assuming the condition is false
                   if (unlikely(head !=3D xas_reload(&xas)))
                                ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   mm/filemap.c:2182:16: note: Assuming the condition is false
                   if (unlikely(head !=3D xas_reload(&xas)))
                                ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'

vim +2371 mm/filemap.c

5963fe031638bb Matthew Wilcox (Oracle  2021-02-24  2336) =

3a6bae48390d25 Matthew Wilcox (Oracle  2021-02-24  2337) static int filemap=
_get_pages(struct kiocb *iocb, struct iov_iter *iter,
ff993ba130009b Matthew Wilcox (Oracle  2021-02-24  2338) 		struct pagevec *=
pvec)
06c0444290cecf Kent Overstreet         2020-12-14  2339  {
06c0444290cecf Kent Overstreet         2020-12-14  2340  	struct file *filp=
 =3D iocb->ki_filp;
06c0444290cecf Kent Overstreet         2020-12-14  2341  	struct address_sp=
ace *mapping =3D filp->f_mapping;
06c0444290cecf Kent Overstreet         2020-12-14  2342  	struct file_ra_st=
ate *ra =3D &filp->f_ra;
06c0444290cecf Kent Overstreet         2020-12-14  2343  	pgoff_t index =3D=
 iocb->ki_pos >> PAGE_SHIFT;
cbd59c48ae2bca Matthew Wilcox (Oracle  2021-02-24  2344) 	pgoff_t last_inde=
x;
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2345) 	struct page *page;
cbd59c48ae2bca Matthew Wilcox (Oracle  2021-02-24  2346) 	int err =3D 0;
06c0444290cecf Kent Overstreet         2020-12-14  2347  =

cbd59c48ae2bca Matthew Wilcox (Oracle  2021-02-24  2348) 	last_index =3D DI=
V_ROUND_UP(iocb->ki_pos + iter->count, PAGE_SIZE);
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2349) retry:
06c0444290cecf Kent Overstreet         2020-12-14  2350  	if (fatal_signal_=
pending(current))
06c0444290cecf Kent Overstreet         2020-12-14  2351  		return -EINTR;
06c0444290cecf Kent Overstreet         2020-12-14  2352  =

cbd59c48ae2bca Matthew Wilcox (Oracle  2021-02-24  2353) 	filemap_get_read_=
batch(mapping, index, last_index, pvec);
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2354) 	if (!pagevec_coun=
t(pvec)) {
06c0444290cecf Kent Overstreet         2020-12-14  2355  		if (iocb->ki_fla=
gs & IOCB_NOIO)
06c0444290cecf Kent Overstreet         2020-12-14  2356  			return -EAGAIN;
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2357) 		page_cache_sync_=
readahead(mapping, ra, filp, index,
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2358) 				last_index - i=
ndex);
cbd59c48ae2bca Matthew Wilcox (Oracle  2021-02-24  2359) 		filemap_get_read=
_batch(mapping, index, last_index, pvec);
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2360) 	}
f253e1854ce844 Matthew Wilcox (Oracle  2021-02-24  2361) 	if (!pagevec_coun=
t(pvec)) {
f253e1854ce844 Matthew Wilcox (Oracle  2021-02-24  2362) 		if (iocb->ki_fla=
gs & (IOCB_NOWAIT | IOCB_WAITQ))
f253e1854ce844 Matthew Wilcox (Oracle  2021-02-24  2363) 			return -EAGAIN;
f253e1854ce844 Matthew Wilcox (Oracle  2021-02-24  2364) 		err =3D filemap_=
create_page(filp, mapping,
f253e1854ce844 Matthew Wilcox (Oracle  2021-02-24  2365) 				iocb->ki_pos >=
> PAGE_SHIFT, pvec);
f253e1854ce844 Matthew Wilcox (Oracle  2021-02-24  2366) 		if (err =3D=3D A=
OP_TRUNCATED_PAGE)
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2367) 			goto retry;
f253e1854ce844 Matthew Wilcox (Oracle  2021-02-24  2368) 		return err;
f253e1854ce844 Matthew Wilcox (Oracle  2021-02-24  2369) 	}
06c0444290cecf Kent Overstreet         2020-12-14  2370  =

2642fca6472572 Matthew Wilcox (Oracle  2021-02-24 @2371) 	page =3D pvec->pa=
ges[pagevec_count(pvec) - 1];
06c0444290cecf Kent Overstreet         2020-12-14  2372  	if (PageReadahead=
(page)) {
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2373) 		err =3D filemap_=
readahead(iocb, filp, mapping, page, last_index);
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2374) 		if (err)
cbd59c48ae2bca Matthew Wilcox (Oracle  2021-02-24  2375) 			goto err;
06c0444290cecf Kent Overstreet         2020-12-14  2376  	}
06c0444290cecf Kent Overstreet         2020-12-14  2377  	if (!PageUptodate=
(page)) {
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2378) 		if ((iocb->ki_fl=
ags & IOCB_WAITQ) && pagevec_count(pvec) > 1)
87d1d7b688319a Matthew Wilcox (Oracle  2021-02-24  2379) 			iocb->ki_flags =
|=3D IOCB_NOWAIT;
fce70da3a80fcd Matthew Wilcox (Oracle  2021-02-24  2380) 		err =3D filemap_=
update_page(iocb, mapping, iter, page);
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2381) 		if (err)
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2382) 			goto err;
06c0444290cecf Kent Overstreet         2020-12-14  2383  	}
06c0444290cecf Kent Overstreet         2020-12-14  2384  =

2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2385) 	return 0;
cbd59c48ae2bca Matthew Wilcox (Oracle  2021-02-24  2386) err:
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2387) 	if (err < 0)
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2388) 		put_page(page);
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2389) 	if (likely(--pvec=
->nr))
ff993ba130009b Matthew Wilcox (Oracle  2021-02-24  2390) 		return 0;
4612aeef09ec49 Matthew Wilcox (Oracle  2021-02-24  2391) 	if (err =3D=3D AO=
P_TRUNCATED_PAGE)
2642fca6472572 Matthew Wilcox (Oracle  2021-02-24  2392) 		goto retry;
06c0444290cecf Kent Overstreet         2020-12-14  2393  	return err;
06c0444290cecf Kent Overstreet         2020-12-14  2394  }
06c0444290cecf Kent Overstreet         2020-12-14  2395  =


:::::: The code at line 2371 was first introduced by commit
:::::: 2642fca647257210bf6127297748d472c22702cd mm/filemap: restructure fil=
emap_get_pages

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7327541011646214741==--


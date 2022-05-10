Content-Type: multipart/mixed; boundary="===============7670092759206942984=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] ubd: add io_uring based userspace block driver
Date: Tue, 10 May 2022 12:09:36 +0800
Message-ID: <202205101111.faCcEO63-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7670092759206942984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220509092312.254354-1-ming.lei@redhat.com>
References: <20220509092312.254354-1-ming.lei@redhat.com>
TO: Ming Lei <ming.lei@redhat.com>

Hi Ming,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20220509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/ubd-add-io_=
uring-based-userspace-block-driver/20220509-173452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-c007-20220509 (https://download.01.org/0day-ci/ar=
chive/20220510/202205101111.faCcEO63-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a38564=
5b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/898085c9876d078827b=
a8b3447e5d1ae4626d092
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ming-Lei/ubd-add-io_uring-based-us=
erspace-block-driver/20220509-173452
        git checkout 898085c9876d078827ba8b3447e5d1ae4626d092
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:2159:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&desc->u.hs.DeviceRemovable[temp], 0xff, temp);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:2286:3: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf, 0, 4);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:2286:3: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                   memset(buf, 0, 4);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/block/ubd_drv.c:192:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(*bv_addr + bv->bv_offset, pg_addr + *pg_off, len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/block/ubd_drv.c:192:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(*bv_addr + bv->bv_offset, pg_addr + *pg_off, len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/block/ubd_drv.c:194:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(pg_addr + *pg_off, *bv_addr + bv->bv_offset, len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/block/ubd_drv.c:194:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(pg_addr + *pg_off, *bv_addr + bv->bv_offset, len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> drivers/block/ubd_drv.c:256:4: warning: Value stored to 'off' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           off =3D 0;
                           ^     ~
   drivers/block/ubd_drv.c:256:4: note: Value stored to 'off' is never read
                           off =3D 0;
                           ^     ~
>> drivers/block/ubd_drv.c:680:12: warning: Access to field 'flags' results=
 in a dereference of an undefined pointer value (loaded from variable 'io')=
 [clang-analyzer-core.NullDereference]
           io->flags &=3D ~UBD_IO_FLAG_ACTIVE;
           ~~        ^
   drivers/block/ubd_drv.c:600:2: note: 'io' declared without an initial va=
lue
           struct ubd_io *io;
           ^~~~~~~~~~~~~~~~~
   drivers/block/ubd_drv.c:605:2: note: Taking false branch
           pr_devel("%s: receieved: cmd op %d, tag %d, queue %d\n",
           ^
   include/linux/printk.h:548:2: note: expanded from macro 'pr_devel'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/block/ubd_drv.c:608:6: note: Assuming the condition is true
           if (!(issue_flags & IO_URING_F_SQE128))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/ubd_drv.c:608:2: note: Taking true branch
           if (!(issue_flags & IO_URING_F_SQE128))
           ^
   drivers/block/ubd_drv.c:609:3: note: Control jumps to line 680
                   goto out;
                   ^
   drivers/block/ubd_drv.c:680:12: note: Access to field 'flags' results in=
 a dereference of an undefined pointer value (loaded from variable 'io')
           io->flags &=3D ~UBD_IO_FLAG_ACTIVE;
           ~~        ^
   drivers/block/ubd_drv.c:854:2: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(disk->disk_name, "ubdb%d", ub->ub_number);
           ^~~~~~~
   drivers/block/ubd_drv.c:854:2: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           sprintf(disk->disk_name, "ubdb%d", ub->ub_number);
           ^~~~~~~
   drivers/block/ubd_drv.c:1104:4: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&ub->dev_info, info, sizeof(*info));
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/block/ubd_drv.c:1104:4: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&ub->dev_info, info, sizeof(*info));
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (39 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/char/lp.c:923:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ppdev_cb, 0, sizeof(ppdev_cb));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/char/lp.c:923:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&ppdev_cb, 0, sizeof(ppdev_cb));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   arch/x86/include/asm/paravirt.h:693:9: warning: Assigned value is garbag=
e or undefined [clang-analyzer-core.uninitialized.Assign]
           return PVOP_ALT_CALLEE0(unsigned long, irq.save_fl, "pushf; pop =
%%rax;",
                  ^
   arch/x86/include/asm/paravirt_types.h:522:2: note: expanded from macro '=
PVOP_ALT_CALLEE0'
           __PVOP_ALT_CALLEESAVE(rettype, op, alt, cond)
           ^
   arch/x86/include/asm/paravirt_types.h:486:2: note: expanded from macro '=
__PVOP_ALT_CALLEESAVE'
           ____PVOP_ALT_CALL(PVOP_RETVAL(rettype), op.func, alt, cond,     \
           ^
   arch/x86/include/asm/paravirt_types.h:460:3: note: expanded from macro '=
____PVOP_ALT_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^

vim +/off +256 drivers/block/ubd_drv.c

898085c9876d07 Ming Lei 2022-05-09  208  =

898085c9876d07 Ming Lei 2022-05-09  209  /* copy rq pages to ubdsrv vm addr=
ess pointed by io->addr */
898085c9876d07 Ming Lei 2022-05-09  210  static int ubd_copy_pages(struct u=
bd_device *ub, struct request *rq)
898085c9876d07 Ming Lei 2022-05-09  211  {
898085c9876d07 Ming Lei 2022-05-09  212  	struct ubd_queue *ubq =3D rq->mq_=
hctx->driver_data;
898085c9876d07 Ming Lei 2022-05-09  213  	struct ubd_io *io =3D &ubq->ios[r=
q->tag];
898085c9876d07 Ming Lei 2022-05-09  214  	struct page *pgs[UBD_MAX_PIN_PAGE=
S];
898085c9876d07 Ming Lei 2022-05-09  215  	const bool to_rq =3D !op_is_write=
(rq->cmd_flags);
898085c9876d07 Ming Lei 2022-05-09  216  	struct req_iterator req_iter;
898085c9876d07 Ming Lei 2022-05-09  217  	struct bio_vec bv;
898085c9876d07 Ming Lei 2022-05-09  218  	unsigned long start =3D io->addr,=
 left =3D rq->__data_len;
898085c9876d07 Ming Lei 2022-05-09  219  	unsigned int idx =3D 0, pg_len =
=3D 0, pg_off =3D 0;
898085c9876d07 Ming Lei 2022-05-09  220  	int nr_pin =3D 0;
898085c9876d07 Ming Lei 2022-05-09  221  	void *pg_addr =3D NULL;
898085c9876d07 Ming Lei 2022-05-09  222  	struct page *curr =3D NULL;
898085c9876d07 Ming Lei 2022-05-09  223  =

898085c9876d07 Ming Lei 2022-05-09  224  	rq_for_each_segment(bv, rq, req_i=
ter) {
898085c9876d07 Ming Lei 2022-05-09  225  		unsigned len, bv_off =3D bv.bv_o=
ffset, bv_len =3D bv.bv_len;
898085c9876d07 Ming Lei 2022-05-09  226  		void *bv_addr =3D NULL;
898085c9876d07 Ming Lei 2022-05-09  227  =

898085c9876d07 Ming Lei 2022-05-09  228  refill:
898085c9876d07 Ming Lei 2022-05-09  229  		if (pg_len =3D=3D 0) {
898085c9876d07 Ming Lei 2022-05-09  230  			unsigned int off =3D 0;
898085c9876d07 Ming Lei 2022-05-09  231  =

898085c9876d07 Ming Lei 2022-05-09  232  			if (pg_addr) {
898085c9876d07 Ming Lei 2022-05-09  233  				kunmap_local(pg_addr);
898085c9876d07 Ming Lei 2022-05-09  234  				if (!to_rq)
898085c9876d07 Ming Lei 2022-05-09  235  					set_page_dirty_lock(curr);
898085c9876d07 Ming Lei 2022-05-09  236  				pg_addr =3D NULL;
898085c9876d07 Ming Lei 2022-05-09  237  			}
898085c9876d07 Ming Lei 2022-05-09  238  =

898085c9876d07 Ming Lei 2022-05-09  239  			/* refill pages */
898085c9876d07 Ming Lei 2022-05-09  240  			if (idx >=3D nr_pin) {
898085c9876d07 Ming Lei 2022-05-09  241  				unsigned int max_pages;
898085c9876d07 Ming Lei 2022-05-09  242  =

898085c9876d07 Ming Lei 2022-05-09  243  				ubd_release_pages(ub, pgs, nr_=
pin);
898085c9876d07 Ming Lei 2022-05-09  244  =

898085c9876d07 Ming Lei 2022-05-09  245  				off =3D start & (PAGE_SIZE - 1=
);
898085c9876d07 Ming Lei 2022-05-09  246  				max_pages =3D round_up(off + l=
eft, PAGE_SIZE);
898085c9876d07 Ming Lei 2022-05-09  247  				nr_pin =3D min_t(unsigned, UBD=
_MAX_PIN_PAGES, max_pages);
898085c9876d07 Ming Lei 2022-05-09  248  				nr_pin =3D ubd_pin_user_pages(=
ub, start, pgs,
898085c9876d07 Ming Lei 2022-05-09  249  						nr_pin, to_rq);
898085c9876d07 Ming Lei 2022-05-09  250  				if (nr_pin <=3D 0)
898085c9876d07 Ming Lei 2022-05-09  251  					return -EINVAL;
898085c9876d07 Ming Lei 2022-05-09  252  				idx =3D 0;
898085c9876d07 Ming Lei 2022-05-09  253  			}
898085c9876d07 Ming Lei 2022-05-09  254  			pg_off =3D off;
898085c9876d07 Ming Lei 2022-05-09  255  			pg_len =3D min(PAGE_SIZE - off,=
 left);
898085c9876d07 Ming Lei 2022-05-09 @256  			off =3D 0;
898085c9876d07 Ming Lei 2022-05-09  257  			curr =3D pgs[idx++];
898085c9876d07 Ming Lei 2022-05-09  258  			pg_addr =3D kmap_local_page(cur=
r);
898085c9876d07 Ming Lei 2022-05-09  259  		}
898085c9876d07 Ming Lei 2022-05-09  260  =

898085c9876d07 Ming Lei 2022-05-09  261  		len =3D ubd_copy_bv(&bv, &bv_add=
r, pg_addr, &pg_off, &pg_len,
898085c9876d07 Ming Lei 2022-05-09  262  				to_rq);
898085c9876d07 Ming Lei 2022-05-09  263  		/* either one of the two has bee=
n consumed */
898085c9876d07 Ming Lei 2022-05-09  264  		WARN_ON_ONCE(bv.bv_len && pg_len=
);
898085c9876d07 Ming Lei 2022-05-09  265  		start +=3D len;
898085c9876d07 Ming Lei 2022-05-09  266  		left -=3D len;
898085c9876d07 Ming Lei 2022-05-09  267  =

898085c9876d07 Ming Lei 2022-05-09  268  		/* overflow */
898085c9876d07 Ming Lei 2022-05-09  269  		WARN_ON_ONCE(left > rq->__data_l=
en);
898085c9876d07 Ming Lei 2022-05-09  270  		WARN_ON_ONCE(bv.bv_len > bv_len);
898085c9876d07 Ming Lei 2022-05-09  271  		if (bv.bv_len)
898085c9876d07 Ming Lei 2022-05-09  272  			goto refill;
898085c9876d07 Ming Lei 2022-05-09  273  =

898085c9876d07 Ming Lei 2022-05-09  274  		bv.bv_len =3D bv_len;
898085c9876d07 Ming Lei 2022-05-09  275  		bv.bv_offset =3D bv_off;
898085c9876d07 Ming Lei 2022-05-09  276  	}
898085c9876d07 Ming Lei 2022-05-09  277  	if (pg_addr) {
898085c9876d07 Ming Lei 2022-05-09  278  		kunmap_local(pg_addr);
898085c9876d07 Ming Lei 2022-05-09  279  		if (!to_rq)
898085c9876d07 Ming Lei 2022-05-09  280  			set_page_dirty_lock(curr);
898085c9876d07 Ming Lei 2022-05-09  281  	}
898085c9876d07 Ming Lei 2022-05-09  282  	ubd_release_pages(ub, pgs, nr_pin=
);
898085c9876d07 Ming Lei 2022-05-09  283  =

898085c9876d07 Ming Lei 2022-05-09  284  	WARN_ON_ONCE(left !=3D 0);
898085c9876d07 Ming Lei 2022-05-09  285  =

898085c9876d07 Ming Lei 2022-05-09  286  	return 0;
898085c9876d07 Ming Lei 2022-05-09  287  }
898085c9876d07 Ming Lei 2022-05-09  288  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7670092759206942984==--


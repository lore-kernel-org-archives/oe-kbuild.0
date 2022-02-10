Content-Type: multipart/mixed; boundary="===============7903446243358049513=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/block/drbd/drbd_main.c:2819:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 10 Feb 2022 16:31:07 +0800
Message-ID: <202202101606.M5qOchRW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7903446243358049513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f4bc5bbb5fef3cf421ba3485d6d383c27ec473ed
commit: fc63a6e08a8c97a3dc3a6f2e1946b949b9a6c2d3 locking/atomic: arm: move =
to ARCH_ATOMIC
date:   9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220205 (https://download.01.org/0day-ci/archi=
ve/20220210/202202101606.M5qOchRW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 78c6b9=
0000292eb37aac5dead6ab26611cd76f42)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfc63a6e08a8c97a3dc3a6f2e1946b949b9a6c2d3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fc63a6e08a8c97a3dc3a6f2e1946b949b9a6c2d3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   8 warnings generated.
   Suppressed 8 warnings (2 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (2 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (2 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (2 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   net/bridge/br_netlink.c:590:3: warning: Value stored to 'br' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   br =3D port->br;
                   ^    ~~~~~~~~
   net/bridge/br_netlink.c:590:3: note: Value stored to 'br' is never read
                   br =3D port->br;
                   ^    ~~~~~~~~
   net/bridge/br_netlink.c:591:3: warning: Value stored to 'port_no' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   port_no =3D port->port_no;
                   ^         ~~~~~~~~~~~~~
   net/bridge/br_netlink.c:591:3: note: Value stored to 'port_no' is never =
read
                   port_no =3D port->port_no;
                   ^         ~~~~~~~~~~~~~
   net/bridge/br_netlink.c:1647:3: warning: Value stored to 'br' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   br =3D p->br;
                   ^    ~~~~~
   net/bridge/br_netlink.c:1647:3: note: Value stored to 'br' is never read
                   br =3D p->br;
                   ^    ~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/block/drbd/drbd_main.c:751:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(p->verify_alg, nc->verify_alg);
                   ^~~~~~
   drivers/block/drbd/drbd_main.c:751:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                   strcpy(p->verify_alg, nc->verify_alg);
                   ^~~~~~
   drivers/block/drbd/drbd_main.c:753:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(p->csums_alg, nc->csums_alg);
                   ^~~~~~
   drivers/block/drbd/drbd_main.c:753:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                   strcpy(p->csums_alg, nc->csums_alg);
                   ^~~~~~
   drivers/block/drbd/drbd_main.c:797:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(p->integrity_alg, nc->integrity_alg);
                   ^~~~~~
   drivers/block/drbd/drbd_main.c:797:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                   strcpy(p->integrity_alg, nc->integrity_alg);
                   ^~~~~~
   drivers/block/drbd/drbd_main.c:1095:37: warning: The result of the left =
shift is undefined because the left operand is negative [clang-analyzer-cor=
e.UndefinedBinaryOperatorResult]
           p->encoding =3D (p->encoding & (~0x7 << 4)) | (n << 4);
                                         ~~~~ ^
   drivers/block/drbd/drbd_main.c:1094:2: note: Assuming the condition is t=
rue
           BUG_ON(n & ~0x7);
           ^
   include/asm-generic/bug.h:63:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/block/drbd/drbd_main.c:1094:2: note: Taking false branch
           BUG_ON(n & ~0x7);
           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/block/drbd/drbd_main.c:1094:2: note: Loop condition is false.  E=
xiting loop
           BUG_ON(n & ~0x7);
           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/block/drbd/drbd_main.c:1095:37: note: The result of the left shi=
ft is undefined because the left operand is negative
           p->encoding =3D (p->encoding & (~0x7 << 4)) | (n << 4);
                                         ~~~~ ^
>> drivers/block/drbd/drbd_main.c:2819:2: warning: Use of memory after it i=
s freed [clang-analyzer-unix.Malloc]
           for_each_connection(connection, resource) {
           ^
   drivers/block/drbd/drbd_int.h:1036:2: note: expanded from macro 'for_eac=
h_connection'
           list_for_each_entry(connection, &resource->connections, connecti=
ons)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/list.h:630:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:703:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/block/drbd/drbd_main.c:2710:6: note: Assuming 'device' is null
           if (device)
               ^~~~~~
   drivers/block/drbd/drbd_main.c:2710:2: note: Taking false branch
           if (device)
           ^
   drivers/block/drbd/drbd_main.c:2715:6: note: Assuming 'device' is non-nu=
ll
           if (!device)
               ^~~~~~~
   drivers/block/drbd/drbd_main.c:2715:2: note: Taking false branch
           if (!device)
           ^
   drivers/block/drbd/drbd_main.c:2727:6: note: Assuming 'q' is non-null
           if (!q)
               ^~
   drivers/block/drbd/drbd_main.c:2727:2: note: Taking false branch
           if (!q)
           ^
   drivers/block/drbd/drbd_main.c:2731:9: note: Assuming '__disk' is non-nu=
ll
           disk =3D alloc_disk(1);
                  ^
   include/linux/genhd.h:278:28: note: expanded from macro 'alloc_disk'
   #define alloc_disk(minors) alloc_disk_node(minors, NUMA_NO_NODE)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/genhd.h:272:6: note: expanded from macro 'alloc_disk_node'
           if (__disk)                                                     \
               ^~~~~~
   drivers/block/drbd/drbd_main.c:2731:9: note: Taking true branch
           disk =3D alloc_disk(1);
                  ^
   include/linux/genhd.h:278:28: note: expanded from macro 'alloc_disk'
   #define alloc_disk(minors) alloc_disk_node(minors, NUMA_NO_NODE)
                              ^
   include/linux/genhd.h:272:2: note: expanded from macro 'alloc_disk_node'
           if (__disk)                                                     \
           ^
   drivers/block/drbd/drbd_main.c:2731:9: note: Loop condition is false.  E=
xiting loop
           disk =3D alloc_disk(1);
                  ^
   include/linux/genhd.h:278:28: note: expanded from macro 'alloc_disk'
   #define alloc_disk(minors) alloc_disk_node(minors, NUMA_NO_NODE)
                              ^
   include/linux/genhd.h:273:3: note: expanded from macro 'alloc_disk_node'
                   lockdep_init_map(&__disk->lockdep_map, __name, &__key, 0=
); \
                   ^
   include/linux/lockdep.h:372:3: note: expanded from macro 'lockdep_init_m=
ap'
                   do { (void)(name); (void)(key); } while (0)
                   ^
   drivers/block/drbd/drbd_main.c:2732:7: note: 'disk' is non-null
           if (!disk)
                ^~~~
   drivers/block/drbd/drbd_main.c:2732:2: note: Taking false branch
           if (!disk)
           ^
   drivers/block/drbd/drbd_main.c:2751:6: note: Assuming field 'page' is no=
n-null
           if (!device->md_io.page)
               ^~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_main.c:2751:2: note: Taking false branch
           if (!device->md_io.page)
           ^
   drivers/block/drbd/drbd_main.c:2754:6: note: Assuming the condition is f=
alse
           if (drbd_bm_init(device))
               ^~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_main.c:2754:2: note: Taking false branch
           if (drbd_bm_init(device))
           ^
   drivers/block/drbd/drbd_main.c:2760:6: note: Assuming 'id' is >=3D 0
           if (id < 0) {
               ^~~~~~
   drivers/block/drbd/drbd_main.c:2760:2: note: Taking false branch
           if (id < 0) {
           ^
   drivers/block/drbd/drbd_main.c:2768:6: note: Assuming 'id' is >=3D 0
           if (id < 0) {
               ^~~~~~
   drivers/block/drbd/drbd_main.c:2768:2: note: Taking false branch
           if (id < 0) {
           ^
   drivers/block/drbd/drbd_main.c:2777:2: note: Left side of '&&' is false
           for_each_connection(connection, resource) {
           ^
   drivers/block/drbd/drbd_int.h:1036:2: note: expanded from macro 'for_eac=
h_connection'
           list_for_each_entry(connection, &resource->connections, connecti=
ons)

vim +2819 drivers/block/drbd/drbd_main.c

113fef9e20e0d6 Lars Ellenberg      2013-03-22  2696  =

a910b12352f5dd Lars Ellenberg      2014-04-28  2697  enum drbd_ret_code drb=
d_create_device(struct drbd_config_context *adm_ctx, unsigned int minor)
b411b3637fa71f Philipp Reisner     2009-09-25  2698  {
a910b12352f5dd Lars Ellenberg      2014-04-28  2699  	struct drbd_resource =
*resource =3D adm_ctx->resource;
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2700  	struct drbd_connectio=
n *connection;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2701  	struct drbd_device *d=
evice;
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2702  	struct drbd_peer_devi=
ce *peer_device, *tmp_peer_device;
b411b3637fa71f Philipp Reisner     2009-09-25  2703  	struct gendisk *disk;
b411b3637fa71f Philipp Reisner     2009-09-25  2704  	struct request_queue =
*q;
93e4bf7a776e86 Andreas Gruenbacher 2013-05-23  2705  	int id;
a910b12352f5dd Lars Ellenberg      2014-04-28  2706  	int vnr =3D adm_ctx->=
volume;
8432b31457bee1 Lars Ellenberg      2011-03-08  2707  	enum drbd_ret_code er=
r =3D ERR_NOMEM;
774b305518a68a Philipp Reisner     2011-02-22  2708  =

b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2709  	device =3D minor_to_d=
evice(minor);
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2710  	if (device)
179e20b8df97e0 Andreas Gruenbacher 2014-11-10  2711  		return ERR_MINOR_OR_=
VOLUME_EXISTS;
b411b3637fa71f Philipp Reisner     2009-09-25  2712  =

b411b3637fa71f Philipp Reisner     2009-09-25  2713  	/* GFP_KERNEL, we are=
 outside of all write-out paths */
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2714  	device =3D kzalloc(si=
zeof(struct drbd_device), GFP_KERNEL);
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2715  	if (!device)
774b305518a68a Philipp Reisner     2011-02-22  2716  		return ERR_NOMEM;
803ea1348e412a Andreas Gruenbacher 2011-06-09  2717  	kref_init(&device->kr=
ef);
803ea1348e412a Andreas Gruenbacher 2011-06-09  2718  =

803ea1348e412a Andreas Gruenbacher 2011-06-09  2719  	kref_get(&resource->k=
ref);
803ea1348e412a Andreas Gruenbacher 2011-06-09  2720  	device->resource =3D =
resource;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2721  	device->minor =3D min=
or;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2722  	device->vnr =3D vnr;
b411b3637fa71f Philipp Reisner     2009-09-25  2723  =

b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2724  	drbd_init_set_default=
s(device);
b411b3637fa71f Philipp Reisner     2009-09-25  2725  =

c62b37d96b6eb3 Christoph Hellwig   2020-07-01  2726  	q =3D blk_alloc_queue=
(NUMA_NO_NODE);
b411b3637fa71f Philipp Reisner     2009-09-25  2727  	if (!q)
b411b3637fa71f Philipp Reisner     2009-09-25  2728  		goto out_no_q;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2729  	device->rq_queue =3D =
q;
b411b3637fa71f Philipp Reisner     2009-09-25  2730  =

b411b3637fa71f Philipp Reisner     2009-09-25  2731  	disk =3D alloc_disk(1=
);
b411b3637fa71f Philipp Reisner     2009-09-25  2732  	if (!disk)
b411b3637fa71f Philipp Reisner     2009-09-25  2733  		goto out_no_disk;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2734  	device->vdisk =3D dis=
k;
b411b3637fa71f Philipp Reisner     2009-09-25  2735  =

81e84650c200de Andreas Gruenbacher 2010-12-09  2736  	set_disk_ro(disk, tru=
e);
b411b3637fa71f Philipp Reisner     2009-09-25  2737  =

b411b3637fa71f Philipp Reisner     2009-09-25  2738  	disk->queue =3D q;
b411b3637fa71f Philipp Reisner     2009-09-25  2739  	disk->major =3D DRBD_=
MAJOR;
b411b3637fa71f Philipp Reisner     2009-09-25  2740  	disk->first_minor =3D=
 minor;
b411b3637fa71f Philipp Reisner     2009-09-25  2741  	disk->fops =3D &drbd_=
ops;
b411b3637fa71f Philipp Reisner     2009-09-25  2742  	sprintf(disk->disk_na=
me, "drbd%d", minor);
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2743  	disk->private_data =
=3D device;
b411b3637fa71f Philipp Reisner     2009-09-25  2744  =

fe8fb75e3a1f6f Jens Axboe          2016-03-30  2745  	blk_queue_write_cache=
(q, true, true);
99432fcc528d7a Philipp Reisner     2011-05-20  2746  	/* Setting the max_hw=
_sectors to an odd value of 8kibyte here
99432fcc528d7a Philipp Reisner     2011-05-20  2747  	   This triggers a ma=
x_bio_size message upon first attach or connect */
99432fcc528d7a Philipp Reisner     2011-05-20  2748  	blk_queue_max_hw_sect=
ors(q, DRBD_MAX_BIO_SIZE_SAFE >> 8);
b411b3637fa71f Philipp Reisner     2009-09-25  2749  =

e37d2438d8e5e4 Lars Ellenberg      2014-04-01  2750  	device->md_io.page =
=3D alloc_page(GFP_KERNEL);
e37d2438d8e5e4 Lars Ellenberg      2014-04-01  2751  	if (!device->md_io.pa=
ge)
b411b3637fa71f Philipp Reisner     2009-09-25  2752  		goto out_no_io_page;
b411b3637fa71f Philipp Reisner     2009-09-25  2753  =

b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2754  	if (drbd_bm_init(devi=
ce))
b411b3637fa71f Philipp Reisner     2009-09-25  2755  		goto out_no_bitmap;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2756  	device->read_requests=
 =3D RB_ROOT;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2757  	device->write_request=
s =3D RB_ROOT;
b411b3637fa71f Philipp Reisner     2009-09-25  2758  =

93e4bf7a776e86 Andreas Gruenbacher 2013-05-23  2759  	id =3D idr_alloc(&drb=
d_devices, device, minor, minor + 1, GFP_KERNEL);
93e4bf7a776e86 Andreas Gruenbacher 2013-05-23  2760  	if (id < 0) {
f221f4bcc5f40e Andreas Gruenbacher 2014-11-10  2761  		if (id =3D=3D -ENOSP=
C)
179e20b8df97e0 Andreas Gruenbacher 2014-11-10  2762  			err =3D ERR_MINOR_O=
R_VOLUME_EXISTS;
56de210245487e Tejun Heo           2013-02-27  2763  		goto out_no_minor_id=
r;
8432b31457bee1 Lars Ellenberg      2011-03-08  2764  	}
803ea1348e412a Andreas Gruenbacher 2011-06-09  2765  	kref_get(&device->kre=
f);
803ea1348e412a Andreas Gruenbacher 2011-06-09  2766  =

803ea1348e412a Andreas Gruenbacher 2011-06-09  2767  	id =3D idr_alloc(&res=
ource->devices, device, vnr, vnr + 1, GFP_KERNEL);
803ea1348e412a Andreas Gruenbacher 2011-06-09  2768  	if (id < 0) {
f221f4bcc5f40e Andreas Gruenbacher 2014-11-10  2769  		if (id =3D=3D -ENOSP=
C)
179e20b8df97e0 Andreas Gruenbacher 2014-11-10  2770  			err =3D ERR_MINOR_O=
R_VOLUME_EXISTS;
803ea1348e412a Andreas Gruenbacher 2011-06-09  2771  		goto out_idr_remove_=
minor;
803ea1348e412a Andreas Gruenbacher 2011-06-09  2772  	}
803ea1348e412a Andreas Gruenbacher 2011-06-09  2773  	kref_get(&device->kre=
f);
8432b31457bee1 Lars Ellenberg      2011-03-08  2774  =

b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2775  	INIT_LIST_HEAD(&devic=
e->peer_devices);
4ce4926683b820 Lars Ellenberg      2014-05-06  2776  	INIT_LIST_HEAD(&devic=
e->pending_bitmap_io);
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2777  	for_each_connection(c=
onnection, resource) {
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2778  		peer_device =3D kzal=
loc(sizeof(struct drbd_peer_device), GFP_KERNEL);
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2779  		if (!peer_device)
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2780  			goto out_idr_remove=
_from_resource;
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2781  		peer_device->connect=
ion =3D connection;
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2782  		peer_device->device =
=3D device;
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2783  =

b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2784  		list_add(&peer_devic=
e->peer_devices, &device->peer_devices);
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2785  		kref_get(&device->kr=
ef);
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2786  =

c06ece6ba6f1bb Andreas Gruenbacher 2011-06-21  2787  		id =3D idr_alloc(&co=
nnection->peer_devices, peer_device, vnr, vnr + 1, GFP_KERNEL);
93e4bf7a776e86 Andreas Gruenbacher 2013-05-23  2788  		if (id < 0) {
f221f4bcc5f40e Andreas Gruenbacher 2014-11-10  2789  			if (id =3D=3D -ENOS=
PC)
8432b31457bee1 Lars Ellenberg      2011-03-08  2790  				err =3D ERR_INVALI=
D_REQUEST;
803ea1348e412a Andreas Gruenbacher 2011-06-09  2791  			goto out_idr_remove=
_from_resource;
56de210245487e Tejun Heo           2013-02-27  2792  		}
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2793  		kref_get(&connection=
->kref);
668700b40a7c87 Philipp Reisner     2015-03-16  2794  		INIT_WORK(&peer_devi=
ce->send_acks_work, drbd_send_acks_wf);
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2795  	}
56de210245487e Tejun Heo           2013-02-27  2796  =

b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2797  	if (init_submitter(de=
vice)) {
113fef9e20e0d6 Lars Ellenberg      2013-03-22  2798  		err =3D ERR_NOMEM;
113fef9e20e0d6 Lars Ellenberg      2013-03-22  2799  		goto out_idr_remove_=
vol;
113fef9e20e0d6 Lars Ellenberg      2013-03-22  2800  	}
113fef9e20e0d6 Lars Ellenberg      2013-03-22  2801  =

774b305518a68a Philipp Reisner     2011-02-22  2802  	add_disk(disk);
774b305518a68a Philipp Reisner     2011-02-22  2803  =

2325eb661f745e Philipp Reisner     2011-03-15  2804  	/* inherit the connec=
tion state */
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2805  	device->state.conn =
=3D first_connection(resource)->cstate;
69a227731a378f Andreas Gruenbacher 2011-08-09  2806  	if (device->state.con=
n =3D=3D C_WF_REPORT_PARAMS) {
69a227731a378f Andreas Gruenbacher 2011-08-09  2807  		for_each_peer_device=
(peer_device, device)
69a227731a378f Andreas Gruenbacher 2011-08-09  2808  			drbd_connected(peer=
_device);
69a227731a378f Andreas Gruenbacher 2011-08-09  2809  	}
4d3d5aa83aa45f Lars Ellenberg      2014-05-02  2810  	/* move to create_pee=
r_device() */
4d3d5aa83aa45f Lars Ellenberg      2014-05-02  2811  	for_each_peer_device(=
peer_device, device)
4d3d5aa83aa45f Lars Ellenberg      2014-05-02  2812  		drbd_debugfs_peer_de=
vice_add(peer_device);
4d3d5aa83aa45f Lars Ellenberg      2014-05-02  2813  	drbd_debugfs_device_a=
dd(device);
774b305518a68a Philipp Reisner     2011-02-22  2814  	return NO_ERROR;
b411b3637fa71f Philipp Reisner     2009-09-25  2815  =

113fef9e20e0d6 Lars Ellenberg      2013-03-22  2816  out_idr_remove_vol:
c06ece6ba6f1bb Andreas Gruenbacher 2011-06-21  2817  	idr_remove(&connectio=
n->peer_devices, vnr);
803ea1348e412a Andreas Gruenbacher 2011-06-09  2818  out_idr_remove_from_re=
source:
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06 @2819  	for_each_connection(c=
onnection, resource) {
d3e709e63e97e5 Matthew Wilcox      2016-12-22  2820  		peer_device =3D idr_=
remove(&connection->peer_devices, vnr);
d3e709e63e97e5 Matthew Wilcox      2016-12-22  2821  		if (peer_device)
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2822  			kref_put(&connectio=
n->kref, drbd_destroy_connection);
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2823  	}
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2824  	for_each_peer_device_=
safe(peer_device, tmp_peer_device, device) {
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2825  		list_del(&peer_devic=
e->peer_devices);
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2826  		kfree(peer_device);
b6f85ef9538b21 Andreas Gruenbacher 2011-07-06  2827  	}
803ea1348e412a Andreas Gruenbacher 2011-06-09  2828  	idr_remove(&resource-=
>devices, vnr);
8432b31457bee1 Lars Ellenberg      2011-03-08  2829  out_idr_remove_minor:
93e4bf7a776e86 Andreas Gruenbacher 2013-05-23  2830  	idr_remove(&drbd_devi=
ces, minor);
569083c08dc16c Lars Ellenberg      2011-03-07  2831  	synchronize_rcu();
8432b31457bee1 Lars Ellenberg      2011-03-08  2832  out_no_minor_idr:
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  2833  	drbd_bm_cleanup(devic=
e);
b411b3637fa71f Philipp Reisner     2009-09-25  2834  out_no_bitmap:
e37d2438d8e5e4 Lars Ellenberg      2014-04-01  2835  	__free_page(device->m=
d_io.page);
b411b3637fa71f Philipp Reisner     2009-09-25  2836  out_no_io_page:
b411b3637fa71f Philipp Reisner     2009-09-25  2837  	put_disk(disk);
b411b3637fa71f Philipp Reisner     2009-09-25  2838  out_no_disk:
b411b3637fa71f Philipp Reisner     2009-09-25  2839  	blk_cleanup_queue(q);
b411b3637fa71f Philipp Reisner     2009-09-25  2840  out_no_q:
803ea1348e412a Andreas Gruenbacher 2011-06-09  2841  	kref_put(&resource->k=
ref, drbd_destroy_resource);
a6b32bc3cebd3f Andreas Gruenbacher 2011-05-31  2842  	kfree(device);
8432b31457bee1 Lars Ellenberg      2011-03-08  2843  	return err;
b411b3637fa71f Philipp Reisner     2009-09-25  2844  }
b411b3637fa71f Philipp Reisner     2009-09-25  2845  =


:::::: The code at line 2819 was first introduced by commit
:::::: b6f85ef9538b2111a8ba0bbfae9aaebabfc94961 drbd: Iterate over all conn=
ections

:::::: TO: Andreas Gruenbacher <agruen@linbit.com>
:::::: CC: Philipp Reisner <philipp.reisner@linbit.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7903446243358049513==--


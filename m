Content-Type: multipart/mixed; boundary="===============3557031014574575694=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kernel/fpu/xstate.c:1580 fpstate_realloc() warn: variable dereferenced before check 'curfps' (see line 1559)
Date: Tue, 25 Jan 2022 03:23:58 +0800
Message-ID: <202201250223.SYDiQopU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3557031014574575694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Jing Liu <jing2.liu@intel.com>
CC: Yang Zhong <yang.zhong@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: c270ce393dfd700e7510a4579568deeefba954fd x86/fpu: Add guest support=
 to xfd_enable_feature()
date:   10 days ago
:::::: branch date: 27 hours ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-m001-20220124 (https://download.01.org/0day-ci/ar=
chive/20220125/202201250223.SYDiQopU-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/kernel/fpu/xstate.c:1580 fpstate_realloc() warn: variable derefere=
nced before check 'curfps' (see line 1559)

Old smatch warnings:
arch/x86/kernel/fpu/xstate.c:375 os_xrstor_booting() warn: mask and shift t=
o zero

vim +/curfps +1580 arch/x86/kernel/fpu/xstate.c

500afbf645a040 Chang S. Bae    2021-10-21  1501  =

500afbf645a040 Chang S. Bae    2021-10-21  1502  /**
500afbf645a040 Chang S. Bae    2021-10-21  1503   * fpstate_realloc - Reall=
ocate struct fpstate for the requested new features
500afbf645a040 Chang S. Bae    2021-10-21  1504   *
500afbf645a040 Chang S. Bae    2021-10-21  1505   * @xfeatures:	A bitmap of=
 xstate features which extend the enabled features
500afbf645a040 Chang S. Bae    2021-10-21  1506   *		of that task
500afbf645a040 Chang S. Bae    2021-10-21  1507   * @ksize:	The required si=
ze for the kernel buffer
500afbf645a040 Chang S. Bae    2021-10-21  1508   * @usize:	The required si=
ze for user space buffers
c270ce393dfd70 Thomas Gleixner 2022-01-05  1509   * @guest_fpu:	Pointer to =
a guest FPU container. NULL for host allocations
500afbf645a040 Chang S. Bae    2021-10-21  1510   *
500afbf645a040 Chang S. Bae    2021-10-21  1511   * Note vs. vmalloc(): If =
the task with a vzalloc()-allocated buffer
500afbf645a040 Chang S. Bae    2021-10-21  1512   * terminates quickly, vfr=
ee()-induced IPIs may be a concern, but tasks
500afbf645a040 Chang S. Bae    2021-10-21  1513   * with large states are l=
ikely to live longer.
500afbf645a040 Chang S. Bae    2021-10-21  1514   *
500afbf645a040 Chang S. Bae    2021-10-21  1515   * Returns: 0 on success, =
-ENOMEM on allocation error.
500afbf645a040 Chang S. Bae    2021-10-21  1516   */
500afbf645a040 Chang S. Bae    2021-10-21  1517  static int fpstate_realloc=
(u64 xfeatures, unsigned int ksize,
c270ce393dfd70 Thomas Gleixner 2022-01-05  1518  			   unsigned int usize, =
struct fpu_guest *guest_fpu)
500afbf645a040 Chang S. Bae    2021-10-21  1519  {
500afbf645a040 Chang S. Bae    2021-10-21  1520  	struct fpu *fpu =3D &curr=
ent->thread.fpu;
500afbf645a040 Chang S. Bae    2021-10-21  1521  	struct fpstate *curfps, *=
newfps =3D NULL;
500afbf645a040 Chang S. Bae    2021-10-21  1522  	unsigned int fpsize;
c270ce393dfd70 Thomas Gleixner 2022-01-05  1523  	bool in_use;
500afbf645a040 Chang S. Bae    2021-10-21  1524  =

500afbf645a040 Chang S. Bae    2021-10-21  1525  	fpsize =3D ksize + ALIGN(=
offsetof(struct fpstate, regs), 64);
500afbf645a040 Chang S. Bae    2021-10-21  1526  =

500afbf645a040 Chang S. Bae    2021-10-21  1527  	newfps =3D vzalloc(fpsize=
);
500afbf645a040 Chang S. Bae    2021-10-21  1528  	if (!newfps)
500afbf645a040 Chang S. Bae    2021-10-21  1529  		return -ENOMEM;
500afbf645a040 Chang S. Bae    2021-10-21  1530  	newfps->size =3D ksize;
500afbf645a040 Chang S. Bae    2021-10-21  1531  	newfps->user_size =3D usi=
ze;
500afbf645a040 Chang S. Bae    2021-10-21  1532  	newfps->is_valloc =3D tru=
e;
500afbf645a040 Chang S. Bae    2021-10-21  1533  =

c270ce393dfd70 Thomas Gleixner 2022-01-05  1534  	/*
c270ce393dfd70 Thomas Gleixner 2022-01-05  1535  	 * When a guest FPU is su=
pplied, use @guest_fpu->fpstate
c270ce393dfd70 Thomas Gleixner 2022-01-05  1536  	 * as reference independe=
nt whether it is in use or not.
c270ce393dfd70 Thomas Gleixner 2022-01-05  1537  	 */
c270ce393dfd70 Thomas Gleixner 2022-01-05  1538  	curfps =3D guest_fpu ? gu=
est_fpu->fpstate : fpu->fpstate;
c270ce393dfd70 Thomas Gleixner 2022-01-05  1539  =

c270ce393dfd70 Thomas Gleixner 2022-01-05  1540  	/* Determine whether @cur=
fps is the active fpstate */
c270ce393dfd70 Thomas Gleixner 2022-01-05  1541  	in_use =3D fpu->fpstate =
=3D=3D curfps;
c270ce393dfd70 Thomas Gleixner 2022-01-05  1542  =

c270ce393dfd70 Thomas Gleixner 2022-01-05  1543  	if (guest_fpu) {
c270ce393dfd70 Thomas Gleixner 2022-01-05  1544  		newfps->is_guest =3D tru=
e;
c270ce393dfd70 Thomas Gleixner 2022-01-05  1545  		newfps->is_confidential =
=3D curfps->is_confidential;
c270ce393dfd70 Thomas Gleixner 2022-01-05  1546  		newfps->in_use =3D curfp=
s->in_use;
c270ce393dfd70 Thomas Gleixner 2022-01-05  1547  		guest_fpu->xfeatures |=
=3D xfeatures;
c270ce393dfd70 Thomas Gleixner 2022-01-05  1548  	}
c270ce393dfd70 Thomas Gleixner 2022-01-05  1549  =

500afbf645a040 Chang S. Bae    2021-10-21  1550  	fpregs_lock();
500afbf645a040 Chang S. Bae    2021-10-21  1551  	/*
c270ce393dfd70 Thomas Gleixner 2022-01-05  1552  	 * If @curfps is in use, =
ensure that the current state is in the
c270ce393dfd70 Thomas Gleixner 2022-01-05  1553  	 * registers before swapp=
ing fpstate as that might invalidate it
c270ce393dfd70 Thomas Gleixner 2022-01-05  1554  	 * due to layout changes.
500afbf645a040 Chang S. Bae    2021-10-21  1555  	 */
c270ce393dfd70 Thomas Gleixner 2022-01-05  1556  	if (in_use && test_thread=
_flag(TIF_NEED_FPU_LOAD))
500afbf645a040 Chang S. Bae    2021-10-21  1557  		fpregs_restore_userregs(=
);
500afbf645a040 Chang S. Bae    2021-10-21  1558  =

500afbf645a040 Chang S. Bae    2021-10-21 @1559  	newfps->xfeatures =3D cur=
fps->xfeatures | xfeatures;
500afbf645a040 Chang S. Bae    2021-10-21  1560  	newfps->user_xfeatures =
=3D curfps->user_xfeatures | xfeatures;
500afbf645a040 Chang S. Bae    2021-10-21  1561  	newfps->xfd =3D curfps->x=
fd & ~xfeatures;
500afbf645a040 Chang S. Bae    2021-10-21  1562  =

500afbf645a040 Chang S. Bae    2021-10-21  1563  	/* Do the final updates w=
ithin the locked region */
500afbf645a040 Chang S. Bae    2021-10-21  1564  	xstate_init_xcomp_bv(&new=
fps->regs.xsave, newfps->xfeatures);
500afbf645a040 Chang S. Bae    2021-10-21  1565  =

c270ce393dfd70 Thomas Gleixner 2022-01-05  1566  	if (guest_fpu) {
c270ce393dfd70 Thomas Gleixner 2022-01-05  1567  		guest_fpu->fpstate =3D n=
ewfps;
c270ce393dfd70 Thomas Gleixner 2022-01-05  1568  		/* If curfps is active, =
update the FPU fpstate pointer */
c270ce393dfd70 Thomas Gleixner 2022-01-05  1569  		if (in_use)
c270ce393dfd70 Thomas Gleixner 2022-01-05  1570  			fpu->fpstate =3D newfps;
c270ce393dfd70 Thomas Gleixner 2022-01-05  1571  	} else {
c270ce393dfd70 Thomas Gleixner 2022-01-05  1572  		fpu->fpstate =3D newfps;
c270ce393dfd70 Thomas Gleixner 2022-01-05  1573  	}
c270ce393dfd70 Thomas Gleixner 2022-01-05  1574  =

c270ce393dfd70 Thomas Gleixner 2022-01-05  1575  	if (in_use)
c270ce393dfd70 Thomas Gleixner 2022-01-05  1576  		xfd_update_state(fpu->fp=
state);
500afbf645a040 Chang S. Bae    2021-10-21  1577  	fpregs_unlock();
500afbf645a040 Chang S. Bae    2021-10-21  1578  =

c270ce393dfd70 Thomas Gleixner 2022-01-05  1579  	/* Only free valloc'ed st=
ate */
c270ce393dfd70 Thomas Gleixner 2022-01-05 @1580  	if (curfps && curfps->is_=
valloc)
500afbf645a040 Chang S. Bae    2021-10-21  1581  		vfree(curfps);
c270ce393dfd70 Thomas Gleixner 2022-01-05  1582  =

500afbf645a040 Chang S. Bae    2021-10-21  1583  	return 0;
500afbf645a040 Chang S. Bae    2021-10-21  1584  }
500afbf645a040 Chang S. Bae    2021-10-21  1585  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3557031014574575694==--


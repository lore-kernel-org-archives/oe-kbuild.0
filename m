Content-Type: multipart/mixed; boundary="===============3579415387329080253=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-review:UPDATE-20200328-034657/Chris-Wilson/drm-i915-execlists-Prevent-GPU-death-on-ELSP-1-promotion-to-idle-context/20200328-034420 1/1] drivers/gpu/drm/i915/gt/intel_gt_irq.c:33 cs_irq_handler() error: we previously assumed 'engine' could be null (see line 27)
Date: Thu, 02 Apr 2020 12:40:01 +0300
Message-ID: <20200402094001.GH2001@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3579415387329080253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20200328-034657/Chr=
is-Wilson/drm-i915-execlists-Prevent-GPU-death-on-ELSP-1-promotion-to-idle-=
context/20200328-034420
head:   40476f4cc604a9d39e96ad5483fc8f21e8144aa8
commit: 40476f4cc604a9d39e96ad5483fc8f21e8144aa8 [1/1] drm/i915/execlists: =
Prevent GPU death on ELSP[1] promotion to idle context

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/gt/intel_gt_irq.c:33 cs_irq_handler() error: we previo=
usly assumed 'engine' could be null (see line 27)

# https://github.com/0day-ci/linux/commit/40476f4cc604a9d39e96ad5483fc8f21e=
8144aa8
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 40476f4cc604a9d39e96ad5483fc8f21e8144aa8
vim +/engine +33 drivers/gpu/drm/i915/gt/intel_gt_irq.c

cf1c97dcb96cb2 Andi Shyti   2019-08-11  22  static void
cf1c97dcb96cb2 Andi Shyti   2019-08-11  23  cs_irq_handler(struct intel_eng=
ine_cs *engine, u32 iir)
cf1c97dcb96cb2 Andi Shyti   2019-08-11  24  {
cf1c97dcb96cb2 Andi Shyti   2019-08-11  25  	bool tasklet =3D false;
cf1c97dcb96cb2 Andi Shyti   2019-08-11  26  =

40476f4cc604a9 Chris Wilson 2020-03-27 @27  	if (engine)
                                                    ^^^^^^
Check for NULL

40476f4cc604a9 Chris Wilson 2020-03-27  28  		ENGINE_TRACE(engine, "iir: %0=
4x\n", iir);
40476f4cc604a9 Chris Wilson 2020-03-27  29  =

70a76a9b8e9d55 Chris Wilson 2020-01-28  30  	if (unlikely(iir & GT_CS_MASTE=
R_ERROR_INTERRUPT)) {
70a76a9b8e9d55 Chris Wilson 2020-01-28  31  		u32 eir;
70a76a9b8e9d55 Chris Wilson 2020-01-28  32  =

70a76a9b8e9d55 Chris Wilson 2020-01-28 @33  		eir =3D ENGINE_READ(engine, R=
ING_EIR);
                                                                          ^=
^^^^^
unchecked dereference.

70a76a9b8e9d55 Chris Wilson 2020-01-28  34  		ENGINE_TRACE(engine, "CS erro=
r: %x\n", eir);
70a76a9b8e9d55 Chris Wilson 2020-01-28  35  =

70a76a9b8e9d55 Chris Wilson 2020-01-28  36  		/* Disable the error interrup=
t until after the reset */
70a76a9b8e9d55 Chris Wilson 2020-01-28  37  		if (likely(eir)) {
70a76a9b8e9d55 Chris Wilson 2020-01-28  38  			ENGINE_WRITE(engine, RING_EM=
R, ~0u);
70a76a9b8e9d55 Chris Wilson 2020-01-28  39  			ENGINE_WRITE(engine, RING_EI=
R, eir);
70a76a9b8e9d55 Chris Wilson 2020-01-28  40  			WRITE_ONCE(engine->execlists=
.error_interrupt, eir);
70a76a9b8e9d55 Chris Wilson 2020-01-28  41  			tasklet =3D true;
70a76a9b8e9d55 Chris Wilson 2020-01-28  42  		}

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3579415387329080253==--


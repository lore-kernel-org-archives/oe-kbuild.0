Content-Type: multipart/mixed; boundary="===============6609143651707631785=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/intel_timeline.c:302 timeline_advance() warn: maybe use && instead of &
Date: Fri, 02 Sep 2022 09:57:36 +0800
Message-ID: <202209020949.2IaurF6j-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6609143651707631785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nicolas Schier <nicolas@fjasle.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   42e66b1cc3a070671001f8a1e933a80818a192bf
commit: 9413e7640564fe70b24ea1a9ff3fb92c5bb52fcb kbuild: split the second l=
ine of *.mod into *.usyms
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m031-20220829 (https://download.01.org/0day-ci/ar=
chive/20220902/202209020949.2IaurF6j-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/gt/intel_timeline.c:302 timeline_advance() warn: maybe=
 use && instead of &

vim +302 drivers/gpu/drm/i915/gt/intel_timeline.c

531958f6f357cf drivers/gpu/drm/i915/gt/intel_timeline.c Chris Wilson   2019=
-08-15  298  =

f0c02c1b91888c drivers/gpu/drm/i915/gt/intel_timeline.c Tvrtko Ursulin 2019=
-06-21  299  static u32 timeline_advance(struct intel_timeline *tl)
ebece7539242a9 drivers/gpu/drm/i915/i915_timeline.c     Chris Wilson   2019=
-03-01  300  {
ccb23d2dcc300d drivers/gpu/drm/i915/gt/intel_timeline.c Chris Wilson   2019=
-08-15  301  	GEM_BUG_ON(!atomic_read(&tl->pin_count));
ebece7539242a9 drivers/gpu/drm/i915/i915_timeline.c     Chris Wilson   2019=
-03-01 @302  	GEM_BUG_ON(tl->seqno & tl->has_initial_breadcrumb);
ebece7539242a9 drivers/gpu/drm/i915/i915_timeline.c     Chris Wilson   2019=
-03-01  303  =

ebece7539242a9 drivers/gpu/drm/i915/i915_timeline.c     Chris Wilson   2019=
-03-01  304  	return tl->seqno +=3D 1 + tl->has_initial_breadcrumb;
ebece7539242a9 drivers/gpu/drm/i915/i915_timeline.c     Chris Wilson   2019=
-03-01  305  }
ebece7539242a9 drivers/gpu/drm/i915/i915_timeline.c     Chris Wilson   2019=
-03-01  306  =


:::::: The code at line 302 was first introduced by commit
:::::: ebece7539242a9204e5748fb6a6b5031d220b164 drm/i915: Keep timeline HWS=
P allocated until idle across the system

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6609143651707631785==--


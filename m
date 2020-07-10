Content-Type: multipart/mixed; boundary="===============2292874840844563474=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mlankhorst:locking-rework 30/30] drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:94:1: sparse: unsigned long extern i915_gem_shrink( ... )
Date: Sat, 11 Jul 2020 07:54:29 +0800
Message-ID: <202007110719.Hx0DYPWD%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2292874840844563474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

tree:   git://people.freedesktop.org/~mlankhorst/linux locking-rework
head:   df835d9d9fee30c2d4584242c64c8b32eae0d0a4
commit: df835d9d9fee30c2d4584242c64c8b32eae0d0a4 [30/30] how to implement e=
viction
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-s022-20200710 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-37-gc9676a3b-dirty
        git checkout df835d9d9fee30c2d4584242c64c8b32eae0d0a4
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:213:54: sparse: sparse: no =
member 'lock' in struct <unnamed>
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:94:1: sparse: sparse: symbo=
l 'i915_gem_shrink' redeclared with different type (incompatible argument 1=
 (different base types)):
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:94:1: sparse:    unsigned l=
ong extern [addressable] [toplevel] [unsigned] i915_gem_shrink( ... )
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.h:15:15: sparse: note: previo=
usly declared as:
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.h:15:15: sparse:    unsigned =
long extern [addressable] [toplevel] [unsigned] i915_gem_shrink( ... )
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:304:33: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@     expected struct i91=
5_gem_ww_ctx *ww @@     got struct drm_i915_private *i915 @@
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:304:33: sparse:     expecte=
d struct i915_gem_ww_ctx *ww
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:304:33: sparse:     got str=
uct drm_i915_private *i915
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:305:35: sparse: sparse: inc=
orrect type in argument 2 (different base types) @@     expected struct drm=
_i915_private *i915 @@     got unsigned long nr_to_scan @@
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:305:35: sparse:     expecte=
d struct drm_i915_private *i915
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:305:35: sparse:     got uns=
igned long nr_to_scan
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:306:34: sparse: sparse: inc=
orrect type in argument 3 (different base types) @@     expected unsigned l=
ong target @@     got unsigned long * @@
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:306:34: sparse:     expecte=
d unsigned long target
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:306:34: sparse:     got uns=
igned long *
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:307:51: sparse: sparse: inc=
orrect type in argument 4 (different base types) @@     expected unsigned l=
ong *nr_scanned @@     got unsigned long @@
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:307:51: sparse:     expecte=
d unsigned long *nr_scanned
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:307:51: sparse:     got uns=
igned long
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:304:32: sparse: sparse: not=
 enough arguments for function i915_gem_shrink
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:313:49: sparse: sparse: not=
 enough arguments for function i915_gem_shrink
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:338:48: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@     expected struct i91=
5_gem_ww_ctx *ww @@     got struct drm_i915_private *i915 @@
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:338:48: sparse:     expecte=
d struct i915_gem_ww_ctx *ww
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:338:48: sparse:     got str=
uct drm_i915_private *i915
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:338:54: sparse: sparse: inc=
orrect type in argument 2 (different base types) @@     expected struct drm=
_i915_private *i915 @@     got unsigned long @@
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:338:54: sparse:     expecte=
d struct drm_i915_private *i915
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:338:54: sparse:     got uns=
igned long
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:338:60: sparse: sparse: inc=
orrect type in argument 3 (different base types) @@     expected unsigned l=
ong target @@     got void * @@
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:338:60: sparse:     expecte=
d unsigned long target
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:338:60: sparse:     got voi=
d *
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:340:68: sparse: sparse: inc=
orrect type in argument 4 (different base types) @@     expected unsigned l=
ong *nr_scanned @@     got unsigned long @@
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:340:68: sparse:     expecte=
d unsigned long *nr_scanned
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:340:68: sparse:     got uns=
igned long
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:338:47: sparse: sparse: not=
 enough arguments for function i915_gem_shrink
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:376:48: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@     expected struct i91=
5_gem_ww_ctx *ww @@     got struct drm_i915_private *i915 @@
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:376:48: sparse:     expecte=
d struct i915_gem_ww_ctx *ww
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:376:48: sparse:     got str=
uct drm_i915_private *i915
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:376:54: sparse: sparse: inc=
orrect type in argument 2 (different base types) @@     expected struct drm=
_i915_private *i915 @@     got unsigned long @@
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:376:54: sparse:     expecte=
d struct drm_i915_private *i915
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:376:54: sparse:     got uns=
igned long
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:376:60: sparse: sparse: inc=
orrect type in argument 3 (different base types) @@     expected unsigned l=
ong target @@     got void * @@
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:376:60: sparse:     expecte=
d unsigned long target
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:376:60: sparse:     got voi=
d *
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:378:68: sparse: sparse: inc=
orrect type in argument 4 (different base types) @@     expected unsigned l=
ong *nr_scanned @@     got unsigned long @@
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:378:68: sparse:     expecte=
d unsigned long *nr_scanned
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:378:68: sparse:     got uns=
igned long
   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:376:47: sparse: sparse: not=
 enough arguments for function i915_gem_shrink

git remote add mlankhorst git://people.freedesktop.org/~mlankhorst/linux
git remote update mlankhorst
git checkout df835d9d9fee30c2d4584242c64c8b32eae0d0a4
vim +94 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c

2d6692e642e7ca drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2019-04-20   67  =

eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   68  /**
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   69   * i915_gem_shrink - Shrink buffer object caches
56fa4bf2b2f084 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-11-23   70   * @i915: i915 device
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   71   * @target: amount of memory to make available, in=
 pages
912d572d63b8cd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-09-06   72   * @nr_scanned: optional output for number of page=
s scanned (incremental)
70972f51819a22 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-12   73   * @shrink: control flags for selecting cache types
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   74   *
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   75   * This function is the main interface to the shri=
nker. It will try to release
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   76   * up to @target pages of main memory backing stor=
age from buffer objects.
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   77   * Selection of the specific caches can be done wi=
th @flags. This is e.g. useful
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   78   * when purgeable objects should be removed from c=
aches preferentially.
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   79   *
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   80   * Note that it's not guaranteed that released amo=
unt is actually available as
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   81   * free system memory - the pages might still be i=
n-used to due to other reasons
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   82   * (like cpu mmaps) or the mm core has reused them=
 before we could grab them.
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   83   * Therefore code that needs to explicitly shrink =
buffer objects caches (e.g. to
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   84   * avoid deadlocks in memory reclaim) must fall ba=
ck to i915_gem_shrink_all().
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   85   *
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   86   * Also note that any kind of pinning (both per-vm=
a address space pins and
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   87   * backing storage pins at the buffer object level=
) result in the shrinker code
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   88   * having to skip the object.
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   89   *
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   90   * Returns:
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   91   * The number of pages of backing storage actually=
 released.
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   92   */
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   93  unsigned long
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  @94  i915_gem_shrink(struct i915_gem_ww_ctx *ww,
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10   95  		struct drm_i915_private *i915,
912d572d63b8cd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-09-06   96  		unsigned long target,
912d572d63b8cd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-09-06   97  		unsigned long *nr_scanned,
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10   98  		unsigned int shrink)
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18   99  {
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  100  	const struct {
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  101  		struct list_head *list;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  102  		unsigned int bit;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  103  	} phases[] =3D {
3b4fa9640ccded drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-05-30  104  		{ &i915->mm.purge_list, ~0u },
ecab9be174d98f drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-12  105  		{
ecab9be174d98f drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-12  106  			&i915->mm.shrink_list,
ecab9be174d98f drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-12  107  			I915_SHRINK_BOUND | I915_SHRINK_UNBOUND
ecab9be174d98f drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-12  108  		},
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  109  		{ NULL, 0 },
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  110  	}, *phase;
538ef96b9dae7f drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2019-01-14  111  	intel_wakeref_t wakeref =3D 0;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  112  	unsigned long count =3D 0;
912d572d63b8cd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-09-06  113  	unsigned long scanned =3D 0;
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  114  	int err;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  115  =

2f6a3783833dde drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-11-08  116  	/*
ce476c80b8bfa8 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-14  117  	 * When shrinking the active list, we should also=
 consider active
ce476c80b8bfa8 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-14  118  	 * contexts. Active contexts are pinned until the=
y are retired, and
ce476c80b8bfa8 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-14  119  	 * so can not be simply unbound to retire and unp=
in their pages. To
ce476c80b8bfa8 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-14  120  	 * shrink the contexts, we must wait until the gp=
u is idle and
ce476c80b8bfa8 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-14  121  	 * completed its switch to the kernel context. In=
 short, we do
ce476c80b8bfa8 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-14  122  	 * not have a good mechanism for idling a specifi=
c context.
2f6a3783833dde drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-11-08  123  	 */
2f6a3783833dde drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-11-08  124  =

a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  125  	trace_i915_gem_shrink(i915, target, shrink);
3abafa539d2c17 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2015-10-01  126  =

178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri =
        2016-05-02  127  	/*
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri =
        2016-05-02  128  	 * Unbinding of objects will require HW access; L=
et us not wake the
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri =
        2016-05-02  129  	 * device just to recover a little memory. If abs=
olutely necessary,
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri =
        2016-05-02  130  	 * we will force the wake during oom-notifier.
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri =
        2016-05-02  131  	 */
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  132  	if (shrink & I915_SHRINK_BOUND) {
d858d5695f3897 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Daniele Ceraolo=
 Spurio 2019-06-13  133  		wakeref =3D intel_runtime_pm_get_if_in_use(&i915=
->runtime_pm);
538ef96b9dae7f drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2019-01-14  134  		if (!wakeref)
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  135  			shrink &=3D ~I915_SHRINK_BOUND;
538ef96b9dae7f drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2019-01-14  136  	}
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri =
        2016-05-02  137  =

be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  138  	/*
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  139  	 * As we may completely rewrite the (un)bound lis=
t whilst unbinding
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  140  	 * (due to retiring requests) we have to strictly=
 process only
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  141  	 * one element of the list at the time, and reche=
ck the list
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  142  	 * on every iteration.
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  143  	 *
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  144  	 * In particular, we must hold a reference whilst=
 removing the
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  145  	 * object as we may end up waiting for and/or ret=
iring the objects.
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  146  	 * This might release the final reference (held b=
y the active list)
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  147  	 * and result in the object being freed from unde=
r us. This is
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  148  	 * similar to the precautions the eviction code m=
ust take whilst
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  149  	 * removing objects.
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  150  	 *
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  151  	 * Also note that although these lists do not hol=
d a reference to
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  152  	 * the object we can safely grab one here: The fi=
nal object
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  153  	 * unreferencing and the bound_list are both prot=
ected by the
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  154  	 * dev->struct_mutex and so we won't ever be able=
 to observe an
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  155  	 * object on the bound_list with a reference coun=
t equals 0.
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  156  	 */
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  157  	for (phase =3D phases; phase->list; phase++) {
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  158  		struct list_head still_in_list;
2a1d775201081c drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2016-07-26  159  		struct drm_i915_gem_object *obj;
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  160  		unsigned long flags;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  161  =

a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  162  		if ((shrink & phase->bit) =3D=3D 0)
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  163  			continue;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  164  =

be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  165  		INIT_LIST_HEAD(&still_in_list);
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-16  166  =

f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-16  167  		/*
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-16  168  		 * We serialize our access to unreferenced objec=
ts through
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-16  169  		 * the use of the struct_mutex. While the object=
s are not
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-16  170  		 * yet freed (due to RCU then a workqueue) we st=
ill want
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-16  171  		 * to be able to shrink their pages, so they rem=
ain on
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-16  172  		 * the unbound/bound list until actually freed.
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-16  173  		 */
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  174  		spin_lock_irqsave(&i915->mm.obj_lock, flags);
2a1d775201081c drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2016-07-26  175  		while (count < target &&
2a1d775201081c drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2016-07-26  176  		       (obj =3D list_first_entry_or_null(phase->=
list,
2a1d775201081c drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2016-07-26  177  						       typeof(*obj),
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-16  178  						       mm.link))) {
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-16  179  			list_move_tail(&obj->mm.link, &still_in_list);
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  180  =

a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  181  			if (shrink & I915_SHRINK_VMAPS &&
a4f5ea64f0a818 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2016-10-28  182  			    !is_vmalloc_addr(obj->mm.mapping))
eae2c43b1233f8 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2016-04-08  183  				continue;
eae2c43b1233f8 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2016-04-08  184  =

a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  185  			if (!(shrink & I915_SHRINK_ACTIVE) &&
c03467ba40f783 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-07-03  186  			    i915_gem_object_is_framebuffer(obj))
5763ff04dc4ebd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2015-10-01  187  				continue;
5763ff04dc4ebd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2015-10-01  188  =

c1a415e261aad0 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2015-12-04  189  			if (!can_release_pages(obj))
c1a415e261aad0 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2015-12-04  190  				continue;
c1a415e261aad0 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2015-12-04  191  =

0bd6cb6b58f733 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-18  192  			if (!kref_get_unless_zero(&obj->base.refcount))
0bd6cb6b58f733 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-18  193  				continue;
0bd6cb6b58f733 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-18  194  =

a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  195  			spin_unlock_irqrestore(&i915->mm.obj_lock, flag=
s);
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-16  196  =

df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  197  			err =3D 0;
c03467ba40f783 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-07-03  198  			if (unsafe_drop_pages(obj, shrink)) {
7b7a119e8546e2 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2016-10-31  199  				/* May arrive from get_pages on another bo */
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  200  				if (!ww) {
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  201  					if (!i915_gem_object_trylock(obj))
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  202  						goto skip;
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  203  				} else {
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  204  					err =3D i915_gem_object_lock(obj, ww);
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  205  					if (err)
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  206  						goto skip;
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  207  				}
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  208  =

f1fa4f442c82eb drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-13  209  				if (!i915_gem_object_has_pages(obj)) {
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  210  					try_to_writeback(obj, shrink);
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  211  					count +=3D obj->base.size >> PAGE_SHIFT;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  212  				}
1233e2db199dea drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2016-10-28 @213  				mutex_unlock(&obj->mm.lock);
1233e2db199dea drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2016-10-28  214  			}
0bd6cb6b58f733 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-18  215  =

4e773c3a8a693e drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-13  216  			scanned +=3D obj->base.size >> PAGE_SHIFT;
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  217  skip:
0bd6cb6b58f733 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-18  218  			i915_gem_object_put(obj);
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-10-16  219  =

a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  220  			spin_lock_irqsave(&i915->mm.obj_lock, flags);
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  221  			if (err)
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  222  				break;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  223  		}
535972771d8c99 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2016-11-01  224  		list_splice_tail(&still_in_list, phase->list);
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  225  		spin_unlock_irqrestore(&i915->mm.obj_lock, flags=
);
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  226  		if (err)
df835d9d9fee30 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhor=
st      2020-07-10  227  			return err;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  228  	}
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  229  =

a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson   =
        2019-06-10  230  	if (shrink & I915_SHRINK_BOUND)
d858d5695f3897 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Daniele Ceraolo=
 Spurio 2019-06-13  231  		intel_runtime_pm_put(&i915->runtime_pm, wakeref);
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri =
        2016-05-02  232  =

912d572d63b8cd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-09-06  233  	if (nr_scanned)
912d572d63b8cd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson   =
        2017-09-06  234  		*nr_scanned +=3D scanned;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  235  	return count;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  236  }
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter  =
        2015-03-18  237  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2292874840844563474==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2292874840844563474==--


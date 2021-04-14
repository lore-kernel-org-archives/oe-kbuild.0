Content-Type: multipart/mixed; boundary="===============8711531945788593361=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/1] drm/i915/dg1: Add HWMON power sensor support
Date: Thu, 15 Apr 2021 04:13:52 +0800
Message-ID: <202104150459.a3tJ7XH1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8711531945788593361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210413212203.793-2-dale.b.stimson@intel.com>
References: <20210413212203.793-2-dale.b.stimson@intel.com>
TO: Dale B Stimson <dale.b.stimson@intel.com>
TO: intel-gfx(a)lists.freedesktop.org

Hi Dale,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20210414]
[cannot apply to v5.12-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dale-B-Stimson/drm-i915-dg=
1-Add-HWMON-power-sensor-support/20210414-052742
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-m001-20210414 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:176 i915_energy1_input_show() error: unin=
itialized symbol 'reg_value'.
drivers/gpu/drm/i915/i915_hwmon.c:198 i915_energy1_input_show() warn: shoul=
d '1 << (nshift - 1)' be a 64 bit type?
drivers/gpu/drm/i915/i915_hwmon.c:240 i915_power1_max_enable_show() error: =
uninitialized symbol 'reg_value'.
drivers/gpu/drm/i915/i915_hwmon.c:64 _field_read_and_scale() error: uniniti=
alized symbol 'reg_value'.
drivers/gpu/drm/i915/i915_hwmon.c:332 i915_power1_cap_enable_show() error: =
uninitialized symbol 'reg_value'.
drivers/gpu/drm/i915/i915_hwmon.c:88 _field_read64_and_scale() error: unini=
tialized symbol 'reg_value'.

vim +/reg_value +176 drivers/gpu/drm/i915/i915_hwmon.c

22ab3625cabc29 Dale B Stimson 2021-04-13   47  =

22ab3625cabc29 Dale B Stimson 2021-04-13   48  /*
22ab3625cabc29 Dale B Stimson 2021-04-13   49   * _field_read_and_scale()
22ab3625cabc29 Dale B Stimson 2021-04-13   50   * Return type of u64 allows=
 for the case where the scaling might cause a
22ab3625cabc29 Dale B Stimson 2021-04-13   51   * result exceeding 32 bits.
22ab3625cabc29 Dale B Stimson 2021-04-13   52   */
22ab3625cabc29 Dale B Stimson 2021-04-13   53  static __always_inline u64
22ab3625cabc29 Dale B Stimson 2021-04-13   54  _field_read_and_scale(struct=
 intel_uncore *uncore, i915_reg_t rgadr,
22ab3625cabc29 Dale B Stimson 2021-04-13   55  		      u32 field_msk, int n=
shift, unsigned int scale_factor)
22ab3625cabc29 Dale B Stimson 2021-04-13   56  {
22ab3625cabc29 Dale B Stimson 2021-04-13   57  	intel_wakeref_t wakeref;
22ab3625cabc29 Dale B Stimson 2021-04-13   58  	u32 reg_value;
22ab3625cabc29 Dale B Stimson 2021-04-13   59  	u64 scaled_val;
22ab3625cabc29 Dale B Stimson 2021-04-13   60  =

22ab3625cabc29 Dale B Stimson 2021-04-13   61  	with_intel_runtime_pm(uncor=
e->rpm, wakeref)
22ab3625cabc29 Dale B Stimson 2021-04-13   62  		reg_value =3D intel_uncore=
_read(uncore, rgadr);
22ab3625cabc29 Dale B Stimson 2021-04-13   63  =

22ab3625cabc29 Dale B Stimson 2021-04-13  @64  	reg_value =3D le32_get_bits=
(cpu_to_le32(reg_value), field_msk);
22ab3625cabc29 Dale B Stimson 2021-04-13   65  	scaled_val =3D mul_u32_u32(=
scale_factor, reg_value);
22ab3625cabc29 Dale B Stimson 2021-04-13   66  =

22ab3625cabc29 Dale B Stimson 2021-04-13   67  	/* Shift, rounding to neare=
st */
22ab3625cabc29 Dale B Stimson 2021-04-13   68  	if (nshift > 0)
22ab3625cabc29 Dale B Stimson 2021-04-13   69  		scaled_val =3D (scaled_val=
 + (1 << (nshift - 1))) >> nshift;
22ab3625cabc29 Dale B Stimson 2021-04-13   70  =

22ab3625cabc29 Dale B Stimson 2021-04-13   71  	return scaled_val;
22ab3625cabc29 Dale B Stimson 2021-04-13   72  }
22ab3625cabc29 Dale B Stimson 2021-04-13   73  =

22ab3625cabc29 Dale B Stimson 2021-04-13   74  /*
22ab3625cabc29 Dale B Stimson 2021-04-13   75   * _field_read64_and_scale()=
 - read a 64-bit register and scale.
22ab3625cabc29 Dale B Stimson 2021-04-13   76   */
22ab3625cabc29 Dale B Stimson 2021-04-13   77  static __always_inline u64
22ab3625cabc29 Dale B Stimson 2021-04-13   78  _field_read64_and_scale(stru=
ct intel_uncore *uncore, i915_reg_t rgadr,
22ab3625cabc29 Dale B Stimson 2021-04-13   79  			u64 field_msk, int nshift=
, unsigned int scale_factor)
22ab3625cabc29 Dale B Stimson 2021-04-13   80  {
22ab3625cabc29 Dale B Stimson 2021-04-13   81  	intel_wakeref_t wakeref;
22ab3625cabc29 Dale B Stimson 2021-04-13   82  	u64 reg_value;
22ab3625cabc29 Dale B Stimson 2021-04-13   83  	u64 scaled_val;
22ab3625cabc29 Dale B Stimson 2021-04-13   84  =

22ab3625cabc29 Dale B Stimson 2021-04-13   85  	with_intel_runtime_pm(uncor=
e->rpm, wakeref)
22ab3625cabc29 Dale B Stimson 2021-04-13   86  		reg_value =3D intel_uncore=
_read64(uncore, rgadr);
22ab3625cabc29 Dale B Stimson 2021-04-13   87  =

22ab3625cabc29 Dale B Stimson 2021-04-13  @88  	reg_value =3D le64_get_bits=
(cpu_to_le64(reg_value), field_msk);
22ab3625cabc29 Dale B Stimson 2021-04-13   89  	scaled_val =3D scale_factor=
 * reg_value;
22ab3625cabc29 Dale B Stimson 2021-04-13   90  =

22ab3625cabc29 Dale B Stimson 2021-04-13   91  	/* Shift, rounding to neare=
st */
22ab3625cabc29 Dale B Stimson 2021-04-13   92  	if (nshift > 0)
22ab3625cabc29 Dale B Stimson 2021-04-13   93  		scaled_val =3D (scaled_val=
 + (1 << (nshift - 1))) >> nshift;
22ab3625cabc29 Dale B Stimson 2021-04-13   94  =

22ab3625cabc29 Dale B Stimson 2021-04-13   95  	return scaled_val;
22ab3625cabc29 Dale B Stimson 2021-04-13   96  }
22ab3625cabc29 Dale B Stimson 2021-04-13   97  =

22ab3625cabc29 Dale B Stimson 2021-04-13   98  /*
22ab3625cabc29 Dale B Stimson 2021-04-13   99   * _field_scale_and_write()
22ab3625cabc29 Dale B Stimson 2021-04-13  100   */
22ab3625cabc29 Dale B Stimson 2021-04-13  101  static __always_inline void
22ab3625cabc29 Dale B Stimson 2021-04-13  102  _field_scale_and_write(struc=
t intel_uncore *uncore,
22ab3625cabc29 Dale B Stimson 2021-04-13  103  		       i915_reg_t rgadr,
22ab3625cabc29 Dale B Stimson 2021-04-13  104  		       u32 field_msk, int =
nshift,
22ab3625cabc29 Dale B Stimson 2021-04-13  105  		       unsigned int scale_=
factor, long lval)
22ab3625cabc29 Dale B Stimson 2021-04-13  106  {
22ab3625cabc29 Dale B Stimson 2021-04-13  107  	u32 nval;
22ab3625cabc29 Dale B Stimson 2021-04-13  108  	u32 bits_to_clear;
22ab3625cabc29 Dale B Stimson 2021-04-13  109  	u32 bits_to_set;
22ab3625cabc29 Dale B Stimson 2021-04-13  110  =

22ab3625cabc29 Dale B Stimson 2021-04-13  111  	/* Computation in 64-bits t=
o avoid overflow. Round to nearest. */
22ab3625cabc29 Dale B Stimson 2021-04-13  112  	nval =3D DIV_ROUND_CLOSEST_=
ULL((u64)lval << nshift, scale_factor);
22ab3625cabc29 Dale B Stimson 2021-04-13  113  =

22ab3625cabc29 Dale B Stimson 2021-04-13  114  	bits_to_clear =3D field_msk;
22ab3625cabc29 Dale B Stimson 2021-04-13  115  	bits_to_set =3D le32_to_cpu=
(le32_encode_bits(nval, field_msk));
22ab3625cabc29 Dale B Stimson 2021-04-13  116  =

22ab3625cabc29 Dale B Stimson 2021-04-13  117  	_locked_with_pm_intel_uncor=
e_rmw(uncore, rgadr,
22ab3625cabc29 Dale B Stimson 2021-04-13  118  					 bits_to_clear, bits_to=
_set);
22ab3625cabc29 Dale B Stimson 2021-04-13  119  }
22ab3625cabc29 Dale B Stimson 2021-04-13  120  =

22ab3625cabc29 Dale B Stimson 2021-04-13  121  /*
22ab3625cabc29 Dale B Stimson 2021-04-13  122   * i915_energy1_input_show -=
 A custom function to obtain energy1_input.
22ab3625cabc29 Dale B Stimson 2021-04-13  123   * Use a custom function ins=
tead of the usual hwmon helpers in order to
22ab3625cabc29 Dale B Stimson 2021-04-13  124   * guarantee 64-bits of resu=
lt to user-space.
22ab3625cabc29 Dale B Stimson 2021-04-13  125   * Units are microjoules.
22ab3625cabc29 Dale B Stimson 2021-04-13  126   *
22ab3625cabc29 Dale B Stimson 2021-04-13  127   * The underlying hardware r=
egister is 32-bits and is subject to overflow.
22ab3625cabc29 Dale B Stimson 2021-04-13  128   * This function compensates=
 for overflow of the 32-bit register by detecting
22ab3625cabc29 Dale B Stimson 2021-04-13  129   * wrap-around and increment=
ing an overflow counter.
22ab3625cabc29 Dale B Stimson 2021-04-13  130   * This only works if the re=
gister is sampled often enough to avoid
22ab3625cabc29 Dale B Stimson 2021-04-13  131   * missing an instance of ov=
erflow - achieved either by repeated
22ab3625cabc29 Dale B Stimson 2021-04-13  132   * queries through the API, =
or via a possible timer (future - TBD) that
22ab3625cabc29 Dale B Stimson 2021-04-13  133   * ensures values are read o=
ften enough to catch all overflows.
22ab3625cabc29 Dale B Stimson 2021-04-13  134   *
22ab3625cabc29 Dale B Stimson 2021-04-13  135   * How long before overflow?=
  For example, with an example scaling bit
22ab3625cabc29 Dale B Stimson 2021-04-13  136   * shift of 14 bits (see reg=
ister *PACKAGE_POWER_SKU_UNIT) and a power draw of
22ab3625cabc29 Dale B Stimson 2021-04-13  137   * 1000 watts, the 32-bit co=
unter will overflow in approximately 4.36 minutes.
22ab3625cabc29 Dale B Stimson 2021-04-13  138   *
22ab3625cabc29 Dale B Stimson 2021-04-13  139   * Examples:
22ab3625cabc29 Dale B Stimson 2021-04-13  140   *    1 watt:  (2^32 >> 14) =
/    1 W / (60 * 60 * 24) secs/day -> 3 days
22ab3625cabc29 Dale B Stimson 2021-04-13  141   * 1000 watts: (2^32 >> 14) =
/ 1000 W / 60             secs/min -> 4.36 minutes
22ab3625cabc29 Dale B Stimson 2021-04-13  142   */
22ab3625cabc29 Dale B Stimson 2021-04-13  143  static ssize_t
22ab3625cabc29 Dale B Stimson 2021-04-13  144  i915_energy1_input_show(stru=
ct device *dev, struct device_attribute *attr,
22ab3625cabc29 Dale B Stimson 2021-04-13  145  			char *buf)
22ab3625cabc29 Dale B Stimson 2021-04-13  146  {
22ab3625cabc29 Dale B Stimson 2021-04-13  147  	struct drm_i915_private *i9=
15 =3D dev_get_drvdata(dev);
22ab3625cabc29 Dale B Stimson 2021-04-13  148  	struct intel_uncore *uncore=
 =3D &i915->uncore;
22ab3625cabc29 Dale B Stimson 2021-04-13  149  	struct i915_hwmon *hwmon =
=3D &i915->hwmon;
22ab3625cabc29 Dale B Stimson 2021-04-13  150  	int nshift =3D hwmon->scl_s=
hift_energy;
22ab3625cabc29 Dale B Stimson 2021-04-13  151  	ssize_t ret;
22ab3625cabc29 Dale B Stimson 2021-04-13  152  	intel_wakeref_t wakeref;
22ab3625cabc29 Dale B Stimson 2021-04-13  153  	u32 reg_value;
22ab3625cabc29 Dale B Stimson 2021-04-13  154  	u64 vlo;
22ab3625cabc29 Dale B Stimson 2021-04-13  155  	u64 vhi;
22ab3625cabc29 Dale B Stimson 2021-04-13  156  =

22ab3625cabc29 Dale B Stimson 2021-04-13  157  	mutex_lock(&hwmon->hwmon_lo=
ck);
22ab3625cabc29 Dale B Stimson 2021-04-13  158  =

22ab3625cabc29 Dale B Stimson 2021-04-13  159  	with_intel_runtime_pm(uncor=
e->rpm, wakeref)
22ab3625cabc29 Dale B Stimson 2021-04-13  160  		reg_value =3D intel_uncore=
_read(uncore,
22ab3625cabc29 Dale B Stimson 2021-04-13  161  					      hwmon->rg.reg_ene=
rgy_status);
22ab3625cabc29 Dale B Stimson 2021-04-13  162  =

22ab3625cabc29 Dale B Stimson 2021-04-13  163  	/*
22ab3625cabc29 Dale B Stimson 2021-04-13  164  	 * The u32 register concate=
nated with the u32 overflow counter
22ab3625cabc29 Dale B Stimson 2021-04-13  165  	 * gives an effective energ=
y counter size of 64-bits.  However, the
22ab3625cabc29 Dale B Stimson 2021-04-13  166  	 * computations below are d=
one modulo 2^96 to avoid overflow during
22ab3625cabc29 Dale B Stimson 2021-04-13  167  	 * scaling in the conversio=
n to microjoules.
22ab3625cabc29 Dale B Stimson 2021-04-13  168  	 *
22ab3625cabc29 Dale B Stimson 2021-04-13  169  	 * The low-order 64-bits of=
 the resulting quantity are returned to
22ab3625cabc29 Dale B Stimson 2021-04-13  170  	 * the caller in units of m=
icrojoules, encoded into a decimal string.
22ab3625cabc29 Dale B Stimson 2021-04-13  171  	 *
22ab3625cabc29 Dale B Stimson 2021-04-13  172  	 * For a power of 1000 watt=
s, 64 bits in units of microjoules will
22ab3625cabc29 Dale B Stimson 2021-04-13  173  	 * overflow after 584 years.
22ab3625cabc29 Dale B Stimson 2021-04-13  174  	 */
22ab3625cabc29 Dale B Stimson 2021-04-13  175  =

22ab3625cabc29 Dale B Stimson 2021-04-13 @176  	if (hwmon->energy_counter_p=
rev > reg_value)
22ab3625cabc29 Dale B Stimson 2021-04-13  177  		hwmon->energy_counter_over=
flow++;
22ab3625cabc29 Dale B Stimson 2021-04-13  178  =

22ab3625cabc29 Dale B Stimson 2021-04-13  179  	hwmon->energy_counter_prev =
=3D reg_value;
22ab3625cabc29 Dale B Stimson 2021-04-13  180  =

22ab3625cabc29 Dale B Stimson 2021-04-13  181  	/*
22ab3625cabc29 Dale B Stimson 2021-04-13  182  	 * 64-bit variables vlo and=
 vhi are used for the scaling process.
22ab3625cabc29 Dale B Stimson 2021-04-13  183  	 * The 96-bit counter value=
 is composed from the two 64-bit variables
22ab3625cabc29 Dale B Stimson 2021-04-13  184  	 * vhi and vlo thusly:  cou=
nter =3D=3D vhi << 32 + vlo .
22ab3625cabc29 Dale B Stimson 2021-04-13  185  	 * The 32-bits of overlap b=
etween the two variables is convenient for
22ab3625cabc29 Dale B Stimson 2021-04-13  186  	 * handling overflows out o=
f vlo.
22ab3625cabc29 Dale B Stimson 2021-04-13  187  	 */
22ab3625cabc29 Dale B Stimson 2021-04-13  188  =

22ab3625cabc29 Dale B Stimson 2021-04-13  189  	vlo =3D reg_value;
22ab3625cabc29 Dale B Stimson 2021-04-13  190  	vhi =3D hwmon->energy_count=
er_overflow;
22ab3625cabc29 Dale B Stimson 2021-04-13  191  =

22ab3625cabc29 Dale B Stimson 2021-04-13  192  	mutex_unlock(&hwmon->hwmon_=
lock);
22ab3625cabc29 Dale B Stimson 2021-04-13  193  =

22ab3625cabc29 Dale B Stimson 2021-04-13  194  	vlo =3D SF_ENERGY * vlo;
22ab3625cabc29 Dale B Stimson 2021-04-13  195  =

22ab3625cabc29 Dale B Stimson 2021-04-13  196  	/* Prepare to round to near=
est */
22ab3625cabc29 Dale B Stimson 2021-04-13  197  	if (nshift > 0)
22ab3625cabc29 Dale B Stimson 2021-04-13 @198  		vlo +=3D 1 << (nshift - 1);
22ab3625cabc29 Dale B Stimson 2021-04-13  199  =

22ab3625cabc29 Dale B Stimson 2021-04-13  200  	/*
22ab3625cabc29 Dale B Stimson 2021-04-13  201  	 * Anything in the upper-32=
 bits of vlo gets added into vhi here,
22ab3625cabc29 Dale B Stimson 2021-04-13  202  	 * and then cleared from vl=
o.
22ab3625cabc29 Dale B Stimson 2021-04-13  203  	 */
22ab3625cabc29 Dale B Stimson 2021-04-13  204  	vhi =3D (SF_ENERGY * vhi) +=
 (vlo >> 32);
22ab3625cabc29 Dale B Stimson 2021-04-13  205  	vlo &=3D 0xffffffffULL;
22ab3625cabc29 Dale B Stimson 2021-04-13  206  =

22ab3625cabc29 Dale B Stimson 2021-04-13  207  	/*
22ab3625cabc29 Dale B Stimson 2021-04-13  208  	 * Apply the right shift.
22ab3625cabc29 Dale B Stimson 2021-04-13  209  	 * - vlo shifted by itself.
22ab3625cabc29 Dale B Stimson 2021-04-13  210  	 * - vlo receiving what's s=
hifted out of vhi.
22ab3625cabc29 Dale B Stimson 2021-04-13  211  	 * - vhi shifted by itself
22ab3625cabc29 Dale B Stimson 2021-04-13  212  	 */
22ab3625cabc29 Dale B Stimson 2021-04-13  213  	vlo =3D vlo >> nshift;
22ab3625cabc29 Dale B Stimson 2021-04-13  214  	vlo |=3D (vhi << (32 - nshi=
ft)) & 0xffffffffULL;
22ab3625cabc29 Dale B Stimson 2021-04-13  215  	vhi =3D vhi >> nshift;
22ab3625cabc29 Dale B Stimson 2021-04-13  216  =

22ab3625cabc29 Dale B Stimson 2021-04-13  217  	/* Combined to get a 64-bit=
 result in vlo. */
22ab3625cabc29 Dale B Stimson 2021-04-13  218  	vlo |=3D (vhi << 32);
22ab3625cabc29 Dale B Stimson 2021-04-13  219  =

22ab3625cabc29 Dale B Stimson 2021-04-13  220  	ret =3D scnprintf(buf, PAGE=
_SIZE, "%llu\n", vlo);
22ab3625cabc29 Dale B Stimson 2021-04-13  221  =

22ab3625cabc29 Dale B Stimson 2021-04-13  222  	return ret;
22ab3625cabc29 Dale B Stimson 2021-04-13  223  }
22ab3625cabc29 Dale B Stimson 2021-04-13  224  =

22ab3625cabc29 Dale B Stimson 2021-04-13  225  static ssize_t
22ab3625cabc29 Dale B Stimson 2021-04-13  226  i915_power1_max_enable_show(=
struct device *dev, struct device_attribute *attr,
22ab3625cabc29 Dale B Stimson 2021-04-13  227  			    char *buf)
22ab3625cabc29 Dale B Stimson 2021-04-13  228  {
22ab3625cabc29 Dale B Stimson 2021-04-13  229  	struct drm_i915_private *i9=
15 =3D dev_get_drvdata(dev);
22ab3625cabc29 Dale B Stimson 2021-04-13  230  	struct intel_uncore *uncore=
 =3D &i915->uncore;
22ab3625cabc29 Dale B Stimson 2021-04-13  231  	intel_wakeref_t wakeref;
22ab3625cabc29 Dale B Stimson 2021-04-13  232  	ssize_t ret;
22ab3625cabc29 Dale B Stimson 2021-04-13  233  	u32 reg_value;
22ab3625cabc29 Dale B Stimson 2021-04-13  234  	bool is_enabled;
22ab3625cabc29 Dale B Stimson 2021-04-13  235  =

22ab3625cabc29 Dale B Stimson 2021-04-13  236  	with_intel_runtime_pm(uncor=
e->rpm, wakeref)
22ab3625cabc29 Dale B Stimson 2021-04-13  237  		reg_value =3D intel_uncore=
_read(uncore,
22ab3625cabc29 Dale B Stimson 2021-04-13  238  					      i915->hwmon.rg.pk=
g_rapl_limit);
22ab3625cabc29 Dale B Stimson 2021-04-13  239  =

22ab3625cabc29 Dale B Stimson 2021-04-13 @240  	is_enabled =3D !!(reg_value=
 & PKG_PWR_LIM_1_EN);
22ab3625cabc29 Dale B Stimson 2021-04-13  241  =

22ab3625cabc29 Dale B Stimson 2021-04-13  242  	ret =3D scnprintf(buf, PAGE=
_SIZE, "%u\n", is_enabled);
22ab3625cabc29 Dale B Stimson 2021-04-13  243  =

22ab3625cabc29 Dale B Stimson 2021-04-13  244  	return ret;
22ab3625cabc29 Dale B Stimson 2021-04-13  245  }
22ab3625cabc29 Dale B Stimson 2021-04-13  246  =

22ab3625cabc29 Dale B Stimson 2021-04-13  247  static ssize_t
22ab3625cabc29 Dale B Stimson 2021-04-13  248  i915_power1_max_enable_store=
(struct device *dev, struct device_attribute *attr,
22ab3625cabc29 Dale B Stimson 2021-04-13  249  			     const char *buf, siz=
e_t count)
22ab3625cabc29 Dale B Stimson 2021-04-13  250  {
22ab3625cabc29 Dale B Stimson 2021-04-13  251  	struct drm_i915_private *i9=
15 =3D dev_get_drvdata(dev);
22ab3625cabc29 Dale B Stimson 2021-04-13  252  	struct intel_uncore *uncore=
 =3D &i915->uncore;
22ab3625cabc29 Dale B Stimson 2021-04-13  253  	struct i915_hwmon *hwmon =
=3D &i915->hwmon;
22ab3625cabc29 Dale B Stimson 2021-04-13  254  	ssize_t ret;
22ab3625cabc29 Dale B Stimson 2021-04-13  255  	u32 val;
22ab3625cabc29 Dale B Stimson 2021-04-13  256  	u32 bits_to_clear;
22ab3625cabc29 Dale B Stimson 2021-04-13  257  	u32 bits_to_set;
22ab3625cabc29 Dale B Stimson 2021-04-13  258  =

22ab3625cabc29 Dale B Stimson 2021-04-13  259  	ret =3D kstrtou32(buf, 0, &=
val);
22ab3625cabc29 Dale B Stimson 2021-04-13  260  	if (ret)
22ab3625cabc29 Dale B Stimson 2021-04-13  261  		return ret;
22ab3625cabc29 Dale B Stimson 2021-04-13  262  =

22ab3625cabc29 Dale B Stimson 2021-04-13  263  	bits_to_clear =3D PKG_PWR_L=
IM_1_EN;
22ab3625cabc29 Dale B Stimson 2021-04-13  264  	if (!val)
22ab3625cabc29 Dale B Stimson 2021-04-13  265  		bits_to_set =3D 0;
22ab3625cabc29 Dale B Stimson 2021-04-13  266  	else
22ab3625cabc29 Dale B Stimson 2021-04-13  267  		bits_to_set =3D PKG_PWR_LI=
M_1_EN;
22ab3625cabc29 Dale B Stimson 2021-04-13  268  =

22ab3625cabc29 Dale B Stimson 2021-04-13  269  	_locked_with_pm_intel_uncor=
e_rmw(uncore, hwmon->rg.pkg_rapl_limit,
22ab3625cabc29 Dale B Stimson 2021-04-13  270  					 bits_to_clear, bits_to=
_set);
22ab3625cabc29 Dale B Stimson 2021-04-13  271  =

22ab3625cabc29 Dale B Stimson 2021-04-13  272  	return count;
22ab3625cabc29 Dale B Stimson 2021-04-13  273  }
22ab3625cabc29 Dale B Stimson 2021-04-13  274  =

22ab3625cabc29 Dale B Stimson 2021-04-13  275  static ssize_t
22ab3625cabc29 Dale B Stimson 2021-04-13  276  i915_power1_max_interval_sho=
w(struct device *dev, struct device_attribute *attr,
22ab3625cabc29 Dale B Stimson 2021-04-13  277  			      char *buf)
22ab3625cabc29 Dale B Stimson 2021-04-13  278  {
22ab3625cabc29 Dale B Stimson 2021-04-13  279  	struct drm_i915_private *i9=
15 =3D dev_get_drvdata(dev);
22ab3625cabc29 Dale B Stimson 2021-04-13  280  	struct intel_uncore *uncore=
 =3D &i915->uncore;
22ab3625cabc29 Dale B Stimson 2021-04-13  281  	struct i915_hwmon *hwmon =
=3D &i915->hwmon;
22ab3625cabc29 Dale B Stimson 2021-04-13  282  	ssize_t ret;
22ab3625cabc29 Dale B Stimson 2021-04-13  283  	u64 ullval;
22ab3625cabc29 Dale B Stimson 2021-04-13  284  =

22ab3625cabc29 Dale B Stimson 2021-04-13  285  	ullval =3D _field_read_and_=
scale(uncore, hwmon->rg.pkg_rapl_limit,
22ab3625cabc29 Dale B Stimson 2021-04-13  286  				       PKG_PWR_LIM_1_TIM=
E,
22ab3625cabc29 Dale B Stimson 2021-04-13  287  				       hwmon->scl_shift_=
time, SF_TIME);
22ab3625cabc29 Dale B Stimson 2021-04-13  288  =

22ab3625cabc29 Dale B Stimson 2021-04-13  289  	ret =3D scnprintf(buf, PAGE=
_SIZE, "%llu\n", ullval);
22ab3625cabc29 Dale B Stimson 2021-04-13  290  =

22ab3625cabc29 Dale B Stimson 2021-04-13  291  	return ret;
22ab3625cabc29 Dale B Stimson 2021-04-13  292  }
22ab3625cabc29 Dale B Stimson 2021-04-13  293  =

22ab3625cabc29 Dale B Stimson 2021-04-13  294  static ssize_t
22ab3625cabc29 Dale B Stimson 2021-04-13  295  i915_power1_max_interval_sto=
re(struct device *dev,
22ab3625cabc29 Dale B Stimson 2021-04-13  296  			       struct device_attr=
ibute *attr,
22ab3625cabc29 Dale B Stimson 2021-04-13  297  			       const char *buf, s=
ize_t count)
22ab3625cabc29 Dale B Stimson 2021-04-13  298  {
22ab3625cabc29 Dale B Stimson 2021-04-13  299  	struct drm_i915_private *i9=
15 =3D dev_get_drvdata(dev);
22ab3625cabc29 Dale B Stimson 2021-04-13  300  	struct intel_uncore *uncore=
 =3D &i915->uncore;
22ab3625cabc29 Dale B Stimson 2021-04-13  301  	struct i915_hwmon *hwmon =
=3D &i915->hwmon;
22ab3625cabc29 Dale B Stimson 2021-04-13  302  	ssize_t ret;
22ab3625cabc29 Dale B Stimson 2021-04-13  303  	long val;
22ab3625cabc29 Dale B Stimson 2021-04-13  304  =

22ab3625cabc29 Dale B Stimson 2021-04-13  305  	ret =3D kstrtoul(buf, 0, &v=
al);
22ab3625cabc29 Dale B Stimson 2021-04-13  306  	if (ret)
22ab3625cabc29 Dale B Stimson 2021-04-13  307  		return ret;
22ab3625cabc29 Dale B Stimson 2021-04-13  308  =

22ab3625cabc29 Dale B Stimson 2021-04-13  309  	_field_scale_and_write(unco=
re, hwmon->rg.pkg_rapl_limit,
22ab3625cabc29 Dale B Stimson 2021-04-13  310  			       PKG_PWR_LIM_2_TIME,
22ab3625cabc29 Dale B Stimson 2021-04-13  311  			       hwmon->scl_shift_t=
ime, SF_TIME, val);
22ab3625cabc29 Dale B Stimson 2021-04-13  312  =

22ab3625cabc29 Dale B Stimson 2021-04-13  313  	return count;
22ab3625cabc29 Dale B Stimson 2021-04-13  314  }
22ab3625cabc29 Dale B Stimson 2021-04-13  315  =

22ab3625cabc29 Dale B Stimson 2021-04-13  316  static ssize_t
22ab3625cabc29 Dale B Stimson 2021-04-13  317  i915_power1_cap_enable_show(=
struct device *dev, struct device_attribute *attr,
22ab3625cabc29 Dale B Stimson 2021-04-13  318  			    char *buf)
22ab3625cabc29 Dale B Stimson 2021-04-13  319  {
22ab3625cabc29 Dale B Stimson 2021-04-13  320  	struct drm_i915_private *i9=
15 =3D dev_get_drvdata(dev);
22ab3625cabc29 Dale B Stimson 2021-04-13  321  	struct intel_uncore *uncore=
 =3D &i915->uncore;
22ab3625cabc29 Dale B Stimson 2021-04-13  322  	struct i915_hwmon *hwmon =
=3D &i915->hwmon;
22ab3625cabc29 Dale B Stimson 2021-04-13  323  	intel_wakeref_t wakeref;
22ab3625cabc29 Dale B Stimson 2021-04-13  324  	ssize_t ret;
22ab3625cabc29 Dale B Stimson 2021-04-13  325  	u32 reg_value;
22ab3625cabc29 Dale B Stimson 2021-04-13  326  	bool is_enabled;
22ab3625cabc29 Dale B Stimson 2021-04-13  327  =

22ab3625cabc29 Dale B Stimson 2021-04-13  328  	with_intel_runtime_pm(uncor=
e->rpm, wakeref)
22ab3625cabc29 Dale B Stimson 2021-04-13  329  		reg_value =3D intel_uncore=
_read(uncore,
22ab3625cabc29 Dale B Stimson 2021-04-13  330  					      hwmon->rg.pkg_rap=
l_limit_udw);
22ab3625cabc29 Dale B Stimson 2021-04-13  331  =

22ab3625cabc29 Dale B Stimson 2021-04-13 @332  	is_enabled =3D !!(reg_value=
 & PKG_PWR_LIM_2_EN);
22ab3625cabc29 Dale B Stimson 2021-04-13  333  =

22ab3625cabc29 Dale B Stimson 2021-04-13  334  	ret =3D scnprintf(buf, PAGE=
_SIZE, "%u\n", is_enabled);
22ab3625cabc29 Dale B Stimson 2021-04-13  335  =

22ab3625cabc29 Dale B Stimson 2021-04-13  336  	return ret;
22ab3625cabc29 Dale B Stimson 2021-04-13  337  }
22ab3625cabc29 Dale B Stimson 2021-04-13  338  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8711531945788593361==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8711531945788593361==--


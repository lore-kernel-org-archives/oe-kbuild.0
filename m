Content-Type: multipart/mixed; boundary="===============1716865190709641154=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [drm-intel:drm-intel-next-queued 1/1] drivers/gpu/drm/i915/i915_irq.c:2283 icp_irq_handler() error: uninitialized symbol 'tc_port_hotplug_long_detect'.
Date: Tue, 15 Oct 2019 12:25:40 +0300
Message-ID: <20191015092540.GE21344@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1716865190709641154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-next-queued
head:   53448aed7b805cf36ecc59ed5fe8e53815ce4fe8
commit: 53448aed7b805cf36ecc59ed5fe8e53815ce4fe8 [1/1] drm/i915/ehl: Port C=
's hotplug interrupt is associated with TC1 bits

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/i915_irq.c:2283 icp_irq_handler() error: uninitialized=
 symbol 'tc_port_hotplug_long_detect'.

git remote add drm-intel git://anongit.freedesktop.org/drm-intel
git remote update drm-intel
git checkout 53448aed7b805cf36ecc59ed5fe8e53815ce4fe8
vim +/tc_port_hotplug_long_detect +2283 drivers/gpu/drm/i915/i915_irq.c

58676af69c2eb1 Lucas De Marchi 2019-08-29  2239  static void icp_irq_handle=
r(struct drm_i915_private *dev_priv, u32 pch_iir)
3160422251b214 Anusha Srivatsa 2018-06-26  2240  {
58676af69c2eb1 Lucas De Marchi 2019-08-29  2241  	u32 ddi_hotplug_trigger, =
tc_hotplug_trigger;
3160422251b214 Anusha Srivatsa 2018-06-26  2242  	u32 pin_mask =3D 0, long_=
mask =3D 0;
58676af69c2eb1 Lucas De Marchi 2019-08-29  2243  	bool (*tc_port_hotplug_lo=
ng_detect)(enum hpd_pin pin, u32 val);
58676af69c2eb1 Lucas De Marchi 2019-08-29  2244  	const u32 *pins;
3160422251b214 Anusha Srivatsa 2018-06-26  2245  =

58676af69c2eb1 Lucas De Marchi 2019-08-29  2246  	if (HAS_PCH_TGP(dev_priv)=
) {
58676af69c2eb1 Lucas De Marchi 2019-08-29  2247  		ddi_hotplug_trigger =3D =
pch_iir & SDE_DDI_MASK_TGP;
58676af69c2eb1 Lucas De Marchi 2019-08-29  2248  		tc_hotplug_trigger =3D p=
ch_iir & SDE_TC_MASK_TGP;
58676af69c2eb1 Lucas De Marchi 2019-08-29  2249  		tc_port_hotplug_long_det=
ect =3D tgp_tc_port_hotplug_long_detect;
58676af69c2eb1 Lucas De Marchi 2019-08-29  2250  		pins =3D hpd_tgp;
58676af69c2eb1 Lucas De Marchi 2019-08-29  2251  	} else if (HAS_PCH_MCC(de=
v_priv)) {
53448aed7b805c Vivek Kasireddy 2019-10-10  2252  		ddi_hotplug_trigger =3D =
pch_iir & SDE_DDI_MASK_ICP;
53448aed7b805c Vivek Kasireddy 2019-10-10  2253  		tc_hotplug_trigger =3D p=
ch_iir & SDE_TC_HOTPLUG_ICP(PORT_TC1);

tc_port_hotplug_long_detect needs to be set here.

d09ad3e7af3ab2 Matt Roper      2019-09-18  2254  		pins =3D hpd_icp;
8ef7e3409cecce Matt Roper      2019-07-30  2255  	} else {
8ef7e3409cecce Matt Roper      2019-07-30  2256  		ddi_hotplug_trigger =3D =
pch_iir & SDE_DDI_MASK_ICP;
8ef7e3409cecce Matt Roper      2019-07-30  2257  		tc_hotplug_trigger =3D p=
ch_iir & SDE_TC_MASK_ICP;
58676af69c2eb1 Lucas De Marchi 2019-08-29  2258  		tc_port_hotplug_long_det=
ect =3D icp_tc_port_hotplug_long_detect;
58676af69c2eb1 Lucas De Marchi 2019-08-29  2259  		pins =3D hpd_icp;
8ef7e3409cecce Matt Roper      2019-07-30  2260  	}
8ef7e3409cecce Matt Roper      2019-07-30  2261  =

3160422251b214 Anusha Srivatsa 2018-06-26  2262  	if (ddi_hotplug_trigger) {
3160422251b214 Anusha Srivatsa 2018-06-26  2263  		u32 dig_hotplug_reg;
3160422251b214 Anusha Srivatsa 2018-06-26  2264  =

3160422251b214 Anusha Srivatsa 2018-06-26  2265  		dig_hotplug_reg =3D I915=
_READ(SHOTPLUG_CTL_DDI);
3160422251b214 Anusha Srivatsa 2018-06-26  2266  		I915_WRITE(SHOTPLUG_CTL_=
DDI, dig_hotplug_reg);
3160422251b214 Anusha Srivatsa 2018-06-26  2267  =

3160422251b214 Anusha Srivatsa 2018-06-26  2268  		intel_get_hpd_pins(dev_p=
riv, &pin_mask, &long_mask,
3160422251b214 Anusha Srivatsa 2018-06-26  2269  				   ddi_hotplug_trigger,
c6f7acb80abf5f Matt Roper      2019-06-14  2270  				   dig_hotplug_reg, pi=
ns,
3160422251b214 Anusha Srivatsa 2018-06-26  2271  				   icp_ddi_port_hotplu=
g_long_detect);
3160422251b214 Anusha Srivatsa 2018-06-26  2272  	}
3160422251b214 Anusha Srivatsa 2018-06-26  2273  =

3160422251b214 Anusha Srivatsa 2018-06-26  2274  	if (tc_hotplug_trigger) {
3160422251b214 Anusha Srivatsa 2018-06-26  2275  		u32 dig_hotplug_reg;
3160422251b214 Anusha Srivatsa 2018-06-26  2276  =

3160422251b214 Anusha Srivatsa 2018-06-26  2277  		dig_hotplug_reg =3D I915=
_READ(SHOTPLUG_CTL_TC);
3160422251b214 Anusha Srivatsa 2018-06-26  2278  		I915_WRITE(SHOTPLUG_CTL_=
TC, dig_hotplug_reg);
3160422251b214 Anusha Srivatsa 2018-06-26  2279  =

3160422251b214 Anusha Srivatsa 2018-06-26  2280  		intel_get_hpd_pins(dev_p=
riv, &pin_mask, &long_mask,
3160422251b214 Anusha Srivatsa 2018-06-26  2281  				   tc_hotplug_trigger,
c6f7acb80abf5f Matt Roper      2019-06-14  2282  				   dig_hotplug_reg, pi=
ns,
58676af69c2eb1 Lucas De Marchi 2019-08-29 @2283  				   tc_port_hotplug_lon=
g_detect);
52dfdba0a98768 Lucas De Marchi 2019-07-25  2284  	}
52dfdba0a98768 Lucas De Marchi 2019-07-25  2285  =

52dfdba0a98768 Lucas De Marchi 2019-07-25  2286  	if (pin_mask)
52dfdba0a98768 Lucas De Marchi 2019-07-25  2287  		intel_hpd_irq_handler(de=
v_priv, pin_mask, long_mask);
52dfdba0a98768 Lucas De Marchi 2019-07-25  2288  =

52dfdba0a98768 Lucas De Marchi 2019-07-25  2289  	if (pch_iir & SDE_GMBUS_I=
CP)
52dfdba0a98768 Lucas De Marchi 2019-07-25  2290  		gmbus_irq_handler(dev_pr=
iv);
52dfdba0a98768 Lucas De Marchi 2019-07-25  2291  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============1716865190709641154==--


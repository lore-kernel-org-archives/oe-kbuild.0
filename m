Content-Type: multipart/mixed; boundary="===============3062234978211955045=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Patch v4 4/4] memory: tegra: Add MC error logging on tegra186 onward
Date: Thu, 03 Mar 2022 12:44:10 +0800
Message-ID: <202203031247.0bBX70B3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3062234978211955045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1646210609-21943-5-git-send-email-amhetre@nvidia.com>
References: <1646210609-21943-5-git-send-email-amhetre@nvidia.com>
TO: Ashish Mhetre <amhetre@nvidia.com>
TO: robh+dt(a)kernel.org
TO: krzysztof.kozlowski(a)canonical.com
TO: thierry.reding(a)gmail.com
TO: jonathanh(a)nvidia.com
TO: digetx(a)gmail.com
TO: linux-kernel(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
TO: linux-tegra(a)vger.kernel.org
CC: vdumpa(a)nvidia.com
CC: Snikam(a)nvidia.com
CC: amhetre(a)nvidia.com

Hi Ashish,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on next-20220302]
[cannot apply to robh/for-next linux/master linus/master v5.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ashish-Mhetre/memory-tegra=
-Add-MC-channels-and-error-logging/20220302-164625
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for=
-next
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: openrisc-randconfig-m031-20220302 (https://download.01.org/0day-ci/=
archive/20220303/202203031247.0bBX70B3-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/memory/tegra/mc.c:593 tegra30_mc_handle_irq() error: uninitialized =
symbol 'channel'.

Old smatch warnings:
drivers/memory/tegra/mc.c:673 tegra30_mc_handle_irq() error: uninitialized =
symbol 'channel'.

vim +/channel +593 drivers/memory/tegra/mc.c

cc84c62c96f257 Ashish Mhetre   2022-03-02  516  =

cc84c62c96f257 Ashish Mhetre   2022-03-02  517  irqreturn_t tegra30_mc_hand=
le_irq(int irq, void *data)
89184651631713 Thierry Reding  2014-04-16  518  {
89184651631713 Thierry Reding  2014-04-16  519  	struct tegra_mc *mc =3D da=
ta;
1c74d5c0de0c2c Dmitry Osipenko 2018-04-09  520  	unsigned long status;
89184651631713 Thierry Reding  2014-04-16  521  	unsigned int bit;
cc84c62c96f257 Ashish Mhetre   2022-03-02  522  	int channel;
cc84c62c96f257 Ashish Mhetre   2022-03-02  523  =

cc84c62c96f257 Ashish Mhetre   2022-03-02  524  	if (mc->soc->num_channels =
&& mc->soc->get_int_channel) {
cc84c62c96f257 Ashish Mhetre   2022-03-02  525  		int err;
cc84c62c96f257 Ashish Mhetre   2022-03-02  526  =

cc84c62c96f257 Ashish Mhetre   2022-03-02  527  		err =3D mc->soc->get_int_=
channel(mc, &channel);
cc84c62c96f257 Ashish Mhetre   2022-03-02  528  		if (err < 0)
cc84c62c96f257 Ashish Mhetre   2022-03-02  529  			return IRQ_NONE;
89184651631713 Thierry Reding  2014-04-16  530  =

89184651631713 Thierry Reding  2014-04-16  531  		/* mask all interrupts to=
 avoid flooding */
cc84c62c96f257 Ashish Mhetre   2022-03-02  532  		status =3D mc_ch_readl(mc=
, channel, MC_INTSTATUS) & mc->soc->intmask;
cc84c62c96f257 Ashish Mhetre   2022-03-02  533  	} else {
1c74d5c0de0c2c Dmitry Osipenko 2018-04-09  534  		status =3D mc_readl(mc, M=
C_INTSTATUS) & mc->soc->intmask;
cc84c62c96f257 Ashish Mhetre   2022-03-02  535  	}
cc84c62c96f257 Ashish Mhetre   2022-03-02  536  =

bf3fbdfbec947c Dmitry Osipenko 2018-04-09  537  	if (!status)
bf3fbdfbec947c Dmitry Osipenko 2018-04-09  538  		return IRQ_NONE;
89184651631713 Thierry Reding  2014-04-16  539  =

89184651631713 Thierry Reding  2014-04-16  540  	for_each_set_bit(bit, &sta=
tus, 32) {
1079a66bc32ff0 Thierry Reding  2021-06-02  541  		const char *error =3D teg=
ra_mc_status_names[bit] ?: "unknown";
89184651631713 Thierry Reding  2014-04-16  542  		const char *client =3D "u=
nknown", *desc;
89184651631713 Thierry Reding  2014-04-16  543  		const char *direction, *s=
ecure;
cc84c62c96f257 Ashish Mhetre   2022-03-02  544  		u32 status_reg, addr_reg;
cc84c62c96f257 Ashish Mhetre   2022-03-02  545  		u32 intmask =3D BIT(bit);
89184651631713 Thierry Reding  2014-04-16  546  		phys_addr_t addr =3D 0;
cc84c62c96f257 Ashish Mhetre   2022-03-02  547  #ifdef CONFIG_PHYS_ADDR_T_6=
4BIT
cc84c62c96f257 Ashish Mhetre   2022-03-02  548  		u32 addr_hi_reg =3D 0;
cc84c62c96f257 Ashish Mhetre   2022-03-02  549  #endif
89184651631713 Thierry Reding  2014-04-16  550  		unsigned int i;
89184651631713 Thierry Reding  2014-04-16  551  		char perm[7];
89184651631713 Thierry Reding  2014-04-16  552  		u8 id, type;
89184651631713 Thierry Reding  2014-04-16  553  		u32 value;
89184651631713 Thierry Reding  2014-04-16  554  =

cc84c62c96f257 Ashish Mhetre   2022-03-02  555  		switch (intmask) {
cc84c62c96f257 Ashish Mhetre   2022-03-02  556  		case MC_INT_DECERR_VPR:
cc84c62c96f257 Ashish Mhetre   2022-03-02  557  			status_reg =3D MC_ERR_VP=
R_STATUS;
cc84c62c96f257 Ashish Mhetre   2022-03-02  558  			addr_reg =3D MC_ERR_VPR_=
ADR;
cc84c62c96f257 Ashish Mhetre   2022-03-02  559  			break;
cc84c62c96f257 Ashish Mhetre   2022-03-02  560  =

cc84c62c96f257 Ashish Mhetre   2022-03-02  561  		case MC_INT_SECERR_SEC:
cc84c62c96f257 Ashish Mhetre   2022-03-02  562  			status_reg =3D MC_ERR_SE=
C_STATUS;
cc84c62c96f257 Ashish Mhetre   2022-03-02  563  			addr_reg =3D MC_ERR_SEC_=
ADR;
cc84c62c96f257 Ashish Mhetre   2022-03-02  564  			break;
cc84c62c96f257 Ashish Mhetre   2022-03-02  565  =

cc84c62c96f257 Ashish Mhetre   2022-03-02  566  		case MC_INT_DECERR_MTS:
cc84c62c96f257 Ashish Mhetre   2022-03-02  567  			status_reg =3D MC_ERR_MT=
S_STATUS;
cc84c62c96f257 Ashish Mhetre   2022-03-02  568  			addr_reg =3D MC_ERR_MTS_=
ADR;
cc84c62c96f257 Ashish Mhetre   2022-03-02  569  			break;
cc84c62c96f257 Ashish Mhetre   2022-03-02  570  =

cc84c62c96f257 Ashish Mhetre   2022-03-02  571  		case MC_INT_DECERR_GENERA=
LIZED_CARVEOUT:
cc84c62c96f257 Ashish Mhetre   2022-03-02  572  			status_reg =3D MC_ERR_GE=
NERALIZED_CARVEOUT_STATUS;
cc84c62c96f257 Ashish Mhetre   2022-03-02  573  			addr_reg =3D MC_ERR_GENE=
RALIZED_CARVEOUT_ADR;
cc84c62c96f257 Ashish Mhetre   2022-03-02  574  			break;
cc84c62c96f257 Ashish Mhetre   2022-03-02  575  =

cc84c62c96f257 Ashish Mhetre   2022-03-02  576  		case MC_INT_DECERR_ROUTE_=
SANITY:
cc84c62c96f257 Ashish Mhetre   2022-03-02  577  			status_reg =3D MC_ERR_RO=
UTE_SANITY_STATUS;
cc84c62c96f257 Ashish Mhetre   2022-03-02  578  			addr_reg =3D MC_ERR_ROUT=
E_SANITY_ADR;
cc84c62c96f257 Ashish Mhetre   2022-03-02  579  			break;
cc84c62c96f257 Ashish Mhetre   2022-03-02  580  =

cc84c62c96f257 Ashish Mhetre   2022-03-02  581  		default:
cc84c62c96f257 Ashish Mhetre   2022-03-02  582  			status_reg =3D MC_ERR_ST=
ATUS;
cc84c62c96f257 Ashish Mhetre   2022-03-02  583  			addr_reg =3D MC_ERR_ADR;
cc84c62c96f257 Ashish Mhetre   2022-03-02  584  =

cc84c62c96f257 Ashish Mhetre   2022-03-02  585  #ifdef CONFIG_PHYS_ADDR_T_6=
4BIT
cc84c62c96f257 Ashish Mhetre   2022-03-02  586  			if (mc->soc->has_addr_hi=
_reg)
cc84c62c96f257 Ashish Mhetre   2022-03-02  587  				addr_hi_reg =3D MC_ERR_=
ADR_HI;
cc84c62c96f257 Ashish Mhetre   2022-03-02  588  #endif
cc84c62c96f257 Ashish Mhetre   2022-03-02  589  			break;
cc84c62c96f257 Ashish Mhetre   2022-03-02  590  		}
cc84c62c96f257 Ashish Mhetre   2022-03-02  591  =

cc84c62c96f257 Ashish Mhetre   2022-03-02  592  		if (mc->soc->num_channels)
cc84c62c96f257 Ashish Mhetre   2022-03-02 @593  			value =3D mc_ch_readl(mc=
, channel, status_reg);
cc84c62c96f257 Ashish Mhetre   2022-03-02  594  		else
cc84c62c96f257 Ashish Mhetre   2022-03-02  595  			value =3D mc_readl(mc, s=
tatus_reg);
89184651631713 Thierry Reding  2014-04-16  596  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3062234978211955045==--


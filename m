Content-Type: multipart/mixed; boundary="===============4227996190160998684=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 6/8] typec: mux: Allow multiple mux_devs per mux
Date: Tue, 28 Dec 2021 23:41:09 +0800
Message-ID: <202112282331.V8Kkx4jf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4227996190160998684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211228052116.1748443-7-bjorn.andersson@linaro.org>
References: <20211228052116.1748443-7-bjorn.andersson@linaro.org>
TO: Bjorn Andersson <bjorn.andersson@linaro.org>
TO: Kishon Vijay Abraham I <kishon@ti.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
TO: Hans de Goede <hdegoede@redhat.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: linux-arm-msm(a)vger.kernel.org
CC: linux-phy(a)lists.infradead.org
CC: devicetree(a)vger.kernel.org

Hi Bjorn,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on robh/for-next driver-core/driver-core-testing l=
inus/master v5.16-rc7]
[cannot apply to next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bjorn-Andersson/typec-mux-=
Introduce-support-for-multiple-TypeC-muxes/20211228-132045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-m001-20211228 (https://download.01.org/0day-ci/ar=
chive/20211228/202112282331.V8Kkx4jf-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/typec/mux.c:114 fwnode_typec_switch_get() warn: possible memory=
 leak of 'sw'
drivers/usb/typec/mux.c:373 fwnode_typec_mux_get() warn: possible memory le=
ak of 'mux'

vim +/sw +114 drivers/usb/typec/mux.c

bdecb33af34f79 Heikki Krogerus 2018-03-20   61  =

bdecb33af34f79 Heikki Krogerus 2018-03-20   62  /**
d1c6a769cdf466 Heikki Krogerus 2020-03-02   63   * fwnode_typec_switch_get =
- Find USB Type-C orientation switch
d1c6a769cdf466 Heikki Krogerus 2020-03-02   64   * @fwnode: The caller devi=
ce node
bdecb33af34f79 Heikki Krogerus 2018-03-20   65   *
bdecb33af34f79 Heikki Krogerus 2018-03-20   66   * Finds a switch linked wi=
th @dev. Returns a reference to the switch on
bdecb33af34f79 Heikki Krogerus 2018-03-20   67   * success, NULL if no matc=
hing connection was found, or
bdecb33af34f79 Heikki Krogerus 2018-03-20   68   * ERR_PTR(-EPROBE_DEFER) w=
hen a connection was found but the switch
bdecb33af34f79 Heikki Krogerus 2018-03-20   69   * has not been enumerated =
yet.
bdecb33af34f79 Heikki Krogerus 2018-03-20   70   */
d1c6a769cdf466 Heikki Krogerus 2020-03-02   71  struct typec_switch *fwnode=
_typec_switch_get(struct fwnode_handle *fwnode)
bdecb33af34f79 Heikki Krogerus 2018-03-20   72  {
8ddb6d277ef580 Bjorn Andersson 2021-12-27   73  	struct typec_switch_dev *s=
w_devs[TYPEC_MUX_MAX_DEVS];
bdecb33af34f79 Heikki Krogerus 2018-03-20   74  	struct typec_switch *sw;
8ddb6d277ef580 Bjorn Andersson 2021-12-27   75  	int count;
8ddb6d277ef580 Bjorn Andersson 2021-12-27   76  	int err;
8ddb6d277ef580 Bjorn Andersson 2021-12-27   77  	int i;
bdecb33af34f79 Heikki Krogerus 2018-03-20   78  =

8d7c70bd032dda Bjorn Andersson 2021-12-27   79  	sw =3D kzalloc(sizeof(*sw)=
, GFP_KERNEL);
8d7c70bd032dda Bjorn Andersson 2021-12-27   80  	if (!sw)
8d7c70bd032dda Bjorn Andersson 2021-12-27   81  		return ERR_PTR(-ENOMEM);
8d7c70bd032dda Bjorn Andersson 2021-12-27   82  =

8ddb6d277ef580 Bjorn Andersson 2021-12-27   83  	count =3D fwnode_connectio=
n_find_matches(fwnode, "orientation-switch", NULL,
8ddb6d277ef580 Bjorn Andersson 2021-12-27   84  					       typec_switch_ma=
tch,
8ddb6d277ef580 Bjorn Andersson 2021-12-27   85  					       (void **)sw_dev=
s,
8ddb6d277ef580 Bjorn Andersson 2021-12-27   86  					       ARRAY_SIZE(sw_d=
evs));
8ddb6d277ef580 Bjorn Andersson 2021-12-27   87  	if (count <=3D 0) {
8d7c70bd032dda Bjorn Andersson 2021-12-27   88  		kfree(sw);
8ddb6d277ef580 Bjorn Andersson 2021-12-27   89  		return NULL;
8d7c70bd032dda Bjorn Andersson 2021-12-27   90  	}
8d7c70bd032dda Bjorn Andersson 2021-12-27   91  =

8ddb6d277ef580 Bjorn Andersson 2021-12-27   92  	for (i =3D 0; i < count; i=
++) {
8ddb6d277ef580 Bjorn Andersson 2021-12-27   93  		if (IS_ERR(sw_devs[i])) {
8ddb6d277ef580 Bjorn Andersson 2021-12-27   94  			err =3D PTR_ERR(sw_devs[=
i]);
8ddb6d277ef580 Bjorn Andersson 2021-12-27   95  			goto put_sw_devs;
8ddb6d277ef580 Bjorn Andersson 2021-12-27   96  		}
8ddb6d277ef580 Bjorn Andersson 2021-12-27   97  	}
8ddb6d277ef580 Bjorn Andersson 2021-12-27   98  =

8ddb6d277ef580 Bjorn Andersson 2021-12-27   99  	for (i =3D 0; i < count; i=
++) {
8ddb6d277ef580 Bjorn Andersson 2021-12-27  100  		WARN_ON(!try_module_get(s=
w_devs[i]->dev.parent->driver->owner));
8ddb6d277ef580 Bjorn Andersson 2021-12-27  101  		sw->sw_devs[i] =3D sw_dev=
s[i];
8ddb6d277ef580 Bjorn Andersson 2021-12-27  102  	}
8d7c70bd032dda Bjorn Andersson 2021-12-27  103  =

8ddb6d277ef580 Bjorn Andersson 2021-12-27  104  	sw->num_sw_devs =3D count;
bdecb33af34f79 Heikki Krogerus 2018-03-20  105  =

bdecb33af34f79 Heikki Krogerus 2018-03-20  106  	return sw;
8ddb6d277ef580 Bjorn Andersson 2021-12-27  107  =

8ddb6d277ef580 Bjorn Andersson 2021-12-27  108  put_sw_devs:
8ddb6d277ef580 Bjorn Andersson 2021-12-27  109  	for (i =3D 0; i < count; i=
++) {
8ddb6d277ef580 Bjorn Andersson 2021-12-27  110  		if (!IS_ERR(sw_devs[i]))
8ddb6d277ef580 Bjorn Andersson 2021-12-27  111  			put_device(&sw_devs[i]->=
dev);
8ddb6d277ef580 Bjorn Andersson 2021-12-27  112  	}
8ddb6d277ef580 Bjorn Andersson 2021-12-27  113  =

8ddb6d277ef580 Bjorn Andersson 2021-12-27 @114  	return ERR_PTR(err);
bdecb33af34f79 Heikki Krogerus 2018-03-20  115  }
d1c6a769cdf466 Heikki Krogerus 2020-03-02  116  EXPORT_SYMBOL_GPL(fwnode_ty=
pec_switch_get);
bdecb33af34f79 Heikki Krogerus 2018-03-20  117  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4227996190160998684==--


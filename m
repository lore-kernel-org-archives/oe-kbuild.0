Content-Type: multipart/mixed; boundary="===============3599929342893111771=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4 15/16] leds: Add common LED binding parsing support to LED class/core
Date: Mon, 18 Nov 2019 08:59:41 +0300
Message-ID: <20191118055941.GB1776@kadam>
In-Reply-To: <773ed63e512f9086483089d67c492d092444bc8a.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3599929342893111771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Matti,

[auto build test WARNING on 31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c]

url:    https://github.com/0day-ci/linux/commits/Matti-Vaittinen/Support-RO=
HM-BD71828-PMIC/20191117-030515
base:    31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/leds/led-core.c:400 fw_is_match() error: uninitialized symbol 'ret'.
drivers/leds/led-core.c:465 led_find_fwnode() error: double free of 'val'

# https://github.com/0day-ci/linux/commit/7b8033cfca34525c9e45fe2e74783fef7=
4f4a49c
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 7b8033cfca34525c9e45fe2e74783fef74f4a49c
vim +/ret +400 drivers/leds/led-core.c

7b8033cfca3452 Matti Vaittinen  2019-11-16  368  static int fw_is_match(str=
uct fwnode_handle *fw,
7b8033cfca3452 Matti Vaittinen  2019-11-16  369  		       struct led_fw_mat=
ch_property *mp, void *val)
bb4e9af0348dfe Jacek Anaszewski 2019-06-09  370  {
7b8033cfca3452 Matti Vaittinen  2019-11-16  371  	void *cmp =3D mp->raw_val;
bb4e9af0348dfe Jacek Anaszewski 2019-06-09  372  	int ret;
bb4e9af0348dfe Jacek Anaszewski 2019-06-09  373  =

7b8033cfca3452 Matti Vaittinen  2019-11-16  374  	if (mp->raw_val) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  375  		ret =3D fwnode_property_=
read_u8_array(fw, mp->name, val,
7b8033cfca3452 Matti Vaittinen  2019-11-16  376  						    mp->size);
7b8033cfca3452 Matti Vaittinen  2019-11-16  377  	} else if (mp->intval) {
                                                                   ^^^^^^^^=
^^
Smatch is complaining about if this is false then ret isn't set.

7b8033cfca3452 Matti Vaittinen  2019-11-16  378  		cmp =3D mp->intval;
7b8033cfca3452 Matti Vaittinen  2019-11-16  379  		switch (mp->size) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  380  		case 1:
7b8033cfca3452 Matti Vaittinen  2019-11-16  381  			ret =3D fwnode_property=
_read_u8_array(fw, mp->name, val,
7b8033cfca3452 Matti Vaittinen  2019-11-16  382  						    mp->size);
7b8033cfca3452 Matti Vaittinen  2019-11-16  383  			break;
7b8033cfca3452 Matti Vaittinen  2019-11-16  384  		case 2:
7b8033cfca3452 Matti Vaittinen  2019-11-16  385  			ret =3D fwnode_property=
_read_u16_array(fw, mp->name, val,
7b8033cfca3452 Matti Vaittinen  2019-11-16  386  						    mp->size);
7b8033cfca3452 Matti Vaittinen  2019-11-16  387  			break;
7b8033cfca3452 Matti Vaittinen  2019-11-16  388  		case 4:
7b8033cfca3452 Matti Vaittinen  2019-11-16  389  			ret =3D fwnode_property=
_read_u32_array(fw, mp->name, val,
7b8033cfca3452 Matti Vaittinen  2019-11-16  390  						    mp->size);
7b8033cfca3452 Matti Vaittinen  2019-11-16  391  			break;
7b8033cfca3452 Matti Vaittinen  2019-11-16  392  		case 8:
7b8033cfca3452 Matti Vaittinen  2019-11-16  393  			ret =3D fwnode_property=
_read_u64_array(fw, mp->name, val,
7b8033cfca3452 Matti Vaittinen  2019-11-16  394  						    mp->size);
7b8033cfca3452 Matti Vaittinen  2019-11-16  395  			break;
7b8033cfca3452 Matti Vaittinen  2019-11-16  396  		default:
7b8033cfca3452 Matti Vaittinen  2019-11-16  397  			return -EINVAL;
7b8033cfca3452 Matti Vaittinen  2019-11-16  398  		}
7b8033cfca3452 Matti Vaittinen  2019-11-16  399  	}
7b8033cfca3452 Matti Vaittinen  2019-11-16 @400  	if (!ret && cmp) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  401  		if (!memcmp(val, cmp, mp=
->size)) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  402  			kfree(val);
                                                                        ^^^=
^^^^^^^
This kfree leads to a double free below.  Freeing it here is a
layering violation, so delete this one and keep the kfree in the caller.

7b8033cfca3452 Matti Vaittinen  2019-11-16  403  			return 1;
7b8033cfca3452 Matti Vaittinen  2019-11-16  404  		}
7b8033cfca3452 Matti Vaittinen  2019-11-16  405  	}
7b8033cfca3452 Matti Vaittinen  2019-11-16  406  	return 0;
7b8033cfca3452 Matti Vaittinen  2019-11-16  407  }
7b8033cfca3452 Matti Vaittinen  2019-11-16  408  /**
7b8033cfca3452 Matti Vaittinen  2019-11-16  409   * led_find_fwnode - find =
fwnode for led
7b8033cfca3452 Matti Vaittinen  2019-11-16  410   * @parent	LED controller =
device
7b8033cfca3452 Matti Vaittinen  2019-11-16  411   * @init_data	led init dat=
a with match information
7b8033cfca3452 Matti Vaittinen  2019-11-16  412   *
7b8033cfca3452 Matti Vaittinen  2019-11-16  413   * Scans the firmware node=
s and returns node matching the given init_data.
7b8033cfca3452 Matti Vaittinen  2019-11-16  414   * NOTE: Function increase=
s refcount for found node. Caller must decrease
7b8033cfca3452 Matti Vaittinen  2019-11-16  415   * refcount using fwnode_h=
andle_put when finished with node.
7b8033cfca3452 Matti Vaittinen  2019-11-16  416   */
7b8033cfca3452 Matti Vaittinen  2019-11-16  417  struct fwnode_handle *led_=
find_fwnode(struct device *parent,
7b8033cfca3452 Matti Vaittinen  2019-11-16  418  				      struct led_init_=
data *init_data)
7b8033cfca3452 Matti Vaittinen  2019-11-16  419  {
7b8033cfca3452 Matti Vaittinen  2019-11-16  420  	struct fwnode_handle *fw;
7b8033cfca3452 Matti Vaittinen  2019-11-16  421  =

7b8033cfca3452 Matti Vaittinen  2019-11-16  422  	/*
7b8033cfca3452 Matti Vaittinen  2019-11-16  423  	 * This should never be c=
alled W/O init data. We could always return
7b8033cfca3452 Matti Vaittinen  2019-11-16  424  	 * dev_fwnode() - but the=
n we should pump-up the refcount
7b8033cfca3452 Matti Vaittinen  2019-11-16  425  	 */
7b8033cfca3452 Matti Vaittinen  2019-11-16  426  	if (!init_data)
7b8033cfca3452 Matti Vaittinen  2019-11-16  427  		return NULL;
7b8033cfca3452 Matti Vaittinen  2019-11-16  428  =

7b8033cfca3452 Matti Vaittinen  2019-11-16  429  	if (!init_data->fwnode)
7b8033cfca3452 Matti Vaittinen  2019-11-16  430  		fw =3D dev_fwnode(parent=
);
7b8033cfca3452 Matti Vaittinen  2019-11-16  431  	else
7b8033cfca3452 Matti Vaittinen  2019-11-16  432  		fw =3D init_data->fwnode;
7b8033cfca3452 Matti Vaittinen  2019-11-16  433  =

7b8033cfca3452 Matti Vaittinen  2019-11-16  434  	if (!fw)
7b8033cfca3452 Matti Vaittinen  2019-11-16  435  		return NULL;
7b8033cfca3452 Matti Vaittinen  2019-11-16  436  =

7b8033cfca3452 Matti Vaittinen  2019-11-16  437  	/*
7b8033cfca3452 Matti Vaittinen  2019-11-16  438  	 * Simple things are pret=
ty. I think simplest is to use DT node-name
7b8033cfca3452 Matti Vaittinen  2019-11-16  439  	 * for matching the node =
with LED - same way regulators use the node
7b8033cfca3452 Matti Vaittinen  2019-11-16  440  	 * name to match with des=
c.
7b8033cfca3452 Matti Vaittinen  2019-11-16  441  	 *
7b8033cfca3452 Matti Vaittinen  2019-11-16  442  	 * This may not work with=
 existing LED DT entries if the node name has
7b8033cfca3452 Matti Vaittinen  2019-11-16  443  	 * been freely selectible=
. In order to this to work the binding doc
7b8033cfca3452 Matti Vaittinen  2019-11-16  444  	 * for LED driver should =
define usable node names.
7b8033cfca3452 Matti Vaittinen  2019-11-16  445  	 *
7b8033cfca3452 Matti Vaittinen  2019-11-16  446  	 * If this is not working=
 we can define specific match property which
7b8033cfca3452 Matti Vaittinen  2019-11-16  447  	 * value we scan and use =
for matching for LEDs connected to the
7b8033cfca3452 Matti Vaittinen  2019-11-16  448  	 * controller.
7b8033cfca3452 Matti Vaittinen  2019-11-16  449  	 */
7b8033cfca3452 Matti Vaittinen  2019-11-16  450  	if (init_data->match_prop=
erty.name && init_data->match_property.size) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  451  		u8 *val;
7b8033cfca3452 Matti Vaittinen  2019-11-16  452  		int ret;
7b8033cfca3452 Matti Vaittinen  2019-11-16  453  		struct fwnode_handle *ch=
ild;
7b8033cfca3452 Matti Vaittinen  2019-11-16  454  		struct led_fw_match_prop=
erty *mp;
7b8033cfca3452 Matti Vaittinen  2019-11-16  455  =

7b8033cfca3452 Matti Vaittinen  2019-11-16  456  		mp =3D &init_data->match=
_property;
7b8033cfca3452 Matti Vaittinen  2019-11-16  457  =

7b8033cfca3452 Matti Vaittinen  2019-11-16  458  		val =3D kzalloc(mp->size=
, GFP_KERNEL);
7b8033cfca3452 Matti Vaittinen  2019-11-16  459  		if (!val)
7b8033cfca3452 Matti Vaittinen  2019-11-16  460  			return ERR_PTR(-ENOMEM);
7b8033cfca3452 Matti Vaittinen  2019-11-16  461  =

7b8033cfca3452 Matti Vaittinen  2019-11-16  462  		fwnode_for_each_child_no=
de(fw, child) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  463  			ret =3D fw_is_match(chi=
ld, mp, val);
                                                                           =
                          ^^^

7b8033cfca3452 Matti Vaittinen  2019-11-16  464  			if (ret > 0) {
7b8033cfca3452 Matti Vaittinen  2019-11-16 @465  				kfree(val);
                                                                           =
           ^^^

Oops.

7b8033cfca3452 Matti Vaittinen  2019-11-16  466  				return child;
7b8033cfca3452 Matti Vaittinen  2019-11-16  467  			}
7b8033cfca3452 Matti Vaittinen  2019-11-16  468  			if (ret < 0) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  469  				dev_err(parent,
7b8033cfca3452 Matti Vaittinen  2019-11-16  470  					"invalid fw match. Us=
e raw_val?\n");
7b8033cfca3452 Matti Vaittinen  2019-11-16  471  				fwnode_handle_put(chil=
d);
7b8033cfca3452 Matti Vaittinen  2019-11-16  472  				break;
7b8033cfca3452 Matti Vaittinen  2019-11-16  473  			}
7b8033cfca3452 Matti Vaittinen  2019-11-16  474  		}
7b8033cfca3452 Matti Vaittinen  2019-11-16  475  		kfree(val);
7b8033cfca3452 Matti Vaittinen  2019-11-16  476  	}
7b8033cfca3452 Matti Vaittinen  2019-11-16  477  	if (init_data->of_match)
7b8033cfca3452 Matti Vaittinen  2019-11-16  478  		fw =3D fwnode_get_named_=
child_node(fw, init_data->of_match);
7b8033cfca3452 Matti Vaittinen  2019-11-16  479  	else
7b8033cfca3452 Matti Vaittinen  2019-11-16  480  		fw =3D fwnode_handle_get=
(fw);
7b8033cfca3452 Matti Vaittinen  2019-11-16  481  =

7b8033cfca3452 Matti Vaittinen  2019-11-16  482  	return fw;
7b8033cfca3452 Matti Vaittinen  2019-11-16  483  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============3599929342893111771==--


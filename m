Content-Type: multipart/mixed; boundary="===============5572698691893807166=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [usb:usb-next 32/38] drivers/usb/typec/hd3ss3220.c:182 hd3ss3220_probe() warn: passing zero to 'PTR_ERR'
Date: Mon, 07 Oct 2019 14:29:40 +0300
Message-ID: <20191007112939.GG21515@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5572698691893807166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ Resending with Fixed email headers - dan ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
next
head:   dd3fd317e2beb899cbffcf364de049b9f9a02db5
commit: 1c48c759ef4bb9031b3347277f04484e07e27d97 [32/38] usb: typec: driver=
 for TI HD3SS3220 USB Type-C DRP port controller

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/typec/hd3ss3220.c:182 hd3ss3220_probe() warn: passing zero to '=
PTR_ERR'

# https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=
=3D1c48c759ef4bb9031b3347277f04484e07e27d97
git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/u=
sb.git
git remote update usb
git checkout 1c48c759ef4bb9031b3347277f04484e07e27d97
vim +/PTR_ERR +182 drivers/usb/typec/hd3ss3220.c

1c48c759ef4bb9 Biju Das 2019-09-04  152  =

1c48c759ef4bb9 Biju Das 2019-09-04  153  static int hd3ss3220_probe(struct =
i2c_client *client,
1c48c759ef4bb9 Biju Das 2019-09-04  154  		const struct i2c_device_id *id)
1c48c759ef4bb9 Biju Das 2019-09-04  155  {
1c48c759ef4bb9 Biju Das 2019-09-04  156  	struct hd3ss3220 *hd3ss3220;
1c48c759ef4bb9 Biju Das 2019-09-04  157  	struct fwnode_handle *connector;
1c48c759ef4bb9 Biju Das 2019-09-04  158  	int ret;
1c48c759ef4bb9 Biju Das 2019-09-04  159  	unsigned int data;
1c48c759ef4bb9 Biju Das 2019-09-04  160  =

1c48c759ef4bb9 Biju Das 2019-09-04  161  	hd3ss3220 =3D devm_kzalloc(&clien=
t->dev, sizeof(struct hd3ss3220),
1c48c759ef4bb9 Biju Das 2019-09-04  162  				 GFP_KERNEL);
1c48c759ef4bb9 Biju Das 2019-09-04  163  	if (!hd3ss3220)
1c48c759ef4bb9 Biju Das 2019-09-04  164  		return -ENOMEM;
1c48c759ef4bb9 Biju Das 2019-09-04  165  =

1c48c759ef4bb9 Biju Das 2019-09-04  166  	i2c_set_clientdata(client, hd3ss3=
220);
1c48c759ef4bb9 Biju Das 2019-09-04  167  =

1c48c759ef4bb9 Biju Das 2019-09-04  168  	hd3ss3220->dev =3D &client->dev;
1c48c759ef4bb9 Biju Das 2019-09-04  169  	hd3ss3220->regmap =3D devm_regmap=
_init_i2c(client, &config);
1c48c759ef4bb9 Biju Das 2019-09-04  170  	if (IS_ERR(hd3ss3220->regmap))
1c48c759ef4bb9 Biju Das 2019-09-04  171  		return PTR_ERR(hd3ss3220->regmap=
);
1c48c759ef4bb9 Biju Das 2019-09-04  172  =

1c48c759ef4bb9 Biju Das 2019-09-04  173  	hd3ss3220_set_source_pref(hd3ss32=
20,
1c48c759ef4bb9 Biju Das 2019-09-04  174  				  HD3SS3220_REG_GEN_CTRL_SRC_P=
REF_DRP_DEFAULT);
1c48c759ef4bb9 Biju Das 2019-09-04  175  	connector =3D device_get_named_ch=
ild_node(hd3ss3220->dev, "connector");
1c48c759ef4bb9 Biju Das 2019-09-04  176  	if (IS_ERR(connector))
1c48c759ef4bb9 Biju Das 2019-09-04  177  		return PTR_ERR(connector);
1c48c759ef4bb9 Biju Das 2019-09-04  178  =

1c48c759ef4bb9 Biju Das 2019-09-04  179  	hd3ss3220->role_sw =3D fwnode_usb=
_role_switch_get(connector);
1c48c759ef4bb9 Biju Das 2019-09-04  180  	fwnode_handle_put(connector);
1c48c759ef4bb9 Biju Das 2019-09-04  181  	if (IS_ERR_OR_NULL(hd3ss3220->rol=
e_sw))
1c48c759ef4bb9 Biju Das 2019-09-04 @182  		return PTR_ERR(hd3ss3220->role_s=
w);

When fwnode_usb_role_switch_get() returns NULL then we return success
here.  It seems like a bug.

When function returns a mix of NULL and error pointers then NULL is a
special case of success.  For example, a module tries to request a
feature but that feature is deliberately turned off.  It's not an error
so we can't return an error pointer, but at same time we can't return
a valid pointer because the feature is disabled.

For fwnode_usb_role_switch_get() it is a bit unclear to me what NULL
means in that context, and there are no comments to explain it...  The
fwnode_connection_find_match() is the same way where it mixes NULL and
error pointers, doesn't have a comment, and it really seems like NULL is
an error, not a special case of success like it's supposed to be.  I
have added Heikki Krogerus to the CC list.

1c48c759ef4bb9 Biju Das 2019-09-04  183  =

1c48c759ef4bb9 Biju Das 2019-09-04  184  	hd3ss3220->typec_cap.prefer_role =
=3D TYPEC_NO_PREFERRED_ROLE;
1c48c759ef4bb9 Biju Das 2019-09-04  185  	hd3ss3220->typec_cap.dr_set =3D h=
d3ss3220_dr_set;
1c48c759ef4bb9 Biju Das 2019-09-04  186  	hd3ss3220->typec_cap.type =3D TYP=
EC_PORT_DRP;
1c48c759ef4bb9 Biju Das 2019-09-04  187  	hd3ss3220->typec_cap.data =3D TYP=
EC_PORT_DRD;
1c48c759ef4bb9 Biju Das 2019-09-04  188  =

1c48c759ef4bb9 Biju Das 2019-09-04  189  	hd3ss3220->port =3D typec_registe=
r_port(&client->dev,
1c48c759ef4bb9 Biju Das 2019-09-04  190  					      &hd3ss3220->typec_cap);
1c48c759ef4bb9 Biju Das 2019-09-04  191  	if (IS_ERR(hd3ss3220->port))
1c48c759ef4bb9 Biju Das 2019-09-04  192  		return PTR_ERR(hd3ss3220->port);

This error path should call usb_role_switch_put(hd3ss3220->role_sw) and
probably a fwnode_handle_put() as well?

I noticed this because I scrolled to the bottom of the fucntion and
noticed that there was only one error label.  When you see a single
error label like that, it's normally a red flag that the error handling
is buggy.  Error labels should have descriptive names which say what
they do.  I suggest something like:

err_unreg_port:
	typec_unregister_port(hd3ss3220->port);
err_put_role:
	usb_role_switch_put(hd3ss3220->role_sw);
err_put_handle:
	fwnode_handle_put(foo bar);

	return ret;

The rule behind this style of error handling is that you just have to
keep track of the most recently allocated resource and at the bottom
you free them in the reverse order from how you allocated them.  Here we
had allocated ->role_sw but the typec_register_port() so we do goto
free_role_sw;  Now people can guess what the goto does because the
name is descriptive and since it matches the most recently allocated
resource that means it's okay.

1c48c759ef4bb9 Biju Das 2019-09-04  193  =

1c48c759ef4bb9 Biju Das 2019-09-04  194  	hd3ss3220_set_role(hd3ss3220);
1c48c759ef4bb9 Biju Das 2019-09-04  195  	ret =3D regmap_read(hd3ss3220->re=
gmap, HD3SS3220_REG_CN_STAT_CTRL, &data);
1c48c759ef4bb9 Biju Das 2019-09-04  196  	if (ret < 0)
1c48c759ef4bb9 Biju Das 2019-09-04  197  		goto error;
1c48c759ef4bb9 Biju Das 2019-09-04  198  =

1c48c759ef4bb9 Biju Das 2019-09-04  199  	if (data & HD3SS3220_REG_CN_STAT_=
CTRL_INT_STATUS) {
1c48c759ef4bb9 Biju Das 2019-09-04  200  		ret =3D regmap_write(hd3ss3220->=
regmap,
1c48c759ef4bb9 Biju Das 2019-09-04  201  				HD3SS3220_REG_CN_STAT_CTRL,
1c48c759ef4bb9 Biju Das 2019-09-04  202  				data | HD3SS3220_REG_CN_STAT_C=
TRL_INT_STATUS);
1c48c759ef4bb9 Biju Das 2019-09-04  203  		if (ret < 0)
1c48c759ef4bb9 Biju Das 2019-09-04  204  			goto error;
1c48c759ef4bb9 Biju Das 2019-09-04  205  	}
1c48c759ef4bb9 Biju Das 2019-09-04  206  =

1c48c759ef4bb9 Biju Das 2019-09-04  207  	if (client->irq > 0) {
1c48c759ef4bb9 Biju Das 2019-09-04  208  		ret =3D devm_request_threaded_ir=
q(&client->dev, client->irq, NULL,
1c48c759ef4bb9 Biju Das 2019-09-04  209  					hd3ss3220_irq_handler,
1c48c759ef4bb9 Biju Das 2019-09-04  210  					IRQF_TRIGGER_FALLING | IRQF_O=
NESHOT,
1c48c759ef4bb9 Biju Das 2019-09-04  211  					"hd3ss3220", &client->dev);
1c48c759ef4bb9 Biju Das 2019-09-04  212  		if (ret)
1c48c759ef4bb9 Biju Das 2019-09-04  213  			goto error;
1c48c759ef4bb9 Biju Das 2019-09-04  214  	}
1c48c759ef4bb9 Biju Das 2019-09-04  215  =

1c48c759ef4bb9 Biju Das 2019-09-04  216  	ret =3D i2c_smbus_read_byte_data(=
client, HD3SS3220_REG_DEV_REV);
1c48c759ef4bb9 Biju Das 2019-09-04  217  	if (ret < 0)
1c48c759ef4bb9 Biju Das 2019-09-04  218  		goto error;
1c48c759ef4bb9 Biju Das 2019-09-04  219  =

1c48c759ef4bb9 Biju Das 2019-09-04  220  	dev_info(&client->dev, "probed re=
vision=3D0x%x\n", ret);
1c48c759ef4bb9 Biju Das 2019-09-04  221  =

1c48c759ef4bb9 Biju Das 2019-09-04  222  	return 0;
1c48c759ef4bb9 Biju Das 2019-09-04  223  error:
1c48c759ef4bb9 Biju Das 2019-09-04  224  	typec_unregister_port(hd3ss3220->=
port);
1c48c759ef4bb9 Biju Das 2019-09-04  225  	usb_role_switch_put(hd3ss3220->ro=
le_sw);
1c48c759ef4bb9 Biju Das 2019-09-04  226  =

1c48c759ef4bb9 Biju Das 2019-09-04  227  	return ret;
1c48c759ef4bb9 Biju Das 2019-09-04  228  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============5572698691893807166==--


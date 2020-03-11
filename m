Content-Type: multipart/mixed; boundary="===============1120704666134945297=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [hverkuil-media:cec-prepare-s-conn 5/5] drivers/media/cec/cec-notifier.c:219 cec_notifier_drm_conn_register() error: double locked 'n->lock' (orig line 195)
Date: Wed, 11 Mar 2020 17:38:38 +0300
Message-ID: <20200311143838.GF11561@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1120704666134945297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://linuxtv.org/hverkuil/media_tree.git cec-prepare-s-conn
head:   6f7efe5f8bb0a93eab41692e3ea1ced81002a604
commit: 6f7efe5f8bb0a93eab41692e3ea1ced81002a604 [5/5] cec-notifier: introd=
uce cec_notifier_drm_conn_register()

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/cec/cec-notifier.c:219 cec_notifier_drm_conn_register() error=
: double locked 'n->lock' (orig line 195)

git remote add hverkuil-media git://linuxtv.org/hverkuil/media_tree.git
git remote update hverkuil-media
git checkout 6f7efe5f8bb0a93eab41692e3ea1ced81002a604
vim +219 drivers/media/cec/cec-notifier.c

b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  16=
7  struct cec_notifier *
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  16=
8  cec_notifier_drm_conn_register(struct device *card_dev,
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  16=
9  			       const struct cec_connector_info *conn_info,
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  17=
0  			       const char *name, struct device *hdmi_dev,
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  17=
1  			       const char *port_name)
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  17=
2  {
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  17=
3  	struct cec_notifier *n =3D NULL;
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  17=
4  =

6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  17=
5  	if (port_name) {
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  17=
6  		n =3D cec_notifier_find_port_name(card_dev, port_name);
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  17=
7  	} else if (hdmi_dev) {
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  17=
8  		n =3D cec_notifier_find_hdmi_dev(hdmi_dev);
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  17=
9  	} else if (conn_info) {
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  18=
0  		n =3D __cec_notifier_find_conn_info(conn_info);
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  18=
1  		/* You shouldn't register the same connector twice */
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  18=
2  		WARN_ON(n);
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  18=
3  	}
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  18=
4  =

f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  18=
5  	if (n) {
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  18=
6  		char *pname =3D NULL;
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  18=
7  =

f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  18=
8  		if (port_name) {
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  18=
9  			pname =3D kstrdup(port_name, GFP_KERNEL);
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  19=
0  			if (!pname) {
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  19=
1  				cec_notifier_put(n);
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  19=
2  				return NULL;
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  19=
3  			}
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  19=
4  		}
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20 @19=
5  		mutex_lock(&n->lock);
                                                                           =
             ^^^^^^^^^^^^^^^^^^^^
This has no unlock.

6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  19=
6  		WARN_ON(n->card_dev || n->hdmi_dev || n->port_name || n->name[0] ||
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  19=
7  			n->conn_info.type);
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  19=
8  		n->card_dev =3D card_dev;
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  19=
9  		n->hdmi_dev =3D hdmi_dev;
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  20=
0  		kfree(n->port_name);
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  20=
1  		n->port_name =3D pname;
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  20=
2  		if (conn_info)
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  20=
3  			n->conn_info =3D *conn_info;
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  20=
4  		else
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  20=
5  			memset(&n->conn_info, 0, sizeof(n->conn_info));
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  20=
6  		strscpy(n->name, name ? : "", sizeof(n->name));
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  20=
7  		n->phys_addr =3D CEC_PHYS_ADDR_INVALID;
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  20=
8  		mutex_unlock(&cec_notifiers_lock);
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  20=
9  	} else {
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  21=
0  		n =3D cec_notifier_alloc(card_dev, name, conn_info,
6f7efe5f8bb0a9 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  21=
1  				       hdmi_dev, port_name);
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  21=
2  		if (!n)
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  21=
3  			return NULL;
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  21=
4  		mutex_lock(&cec_notifiers_lock);
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  21=
5  		list_add_tail(&n->head, &cec_notifiers);
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  21=
6  		mutex_unlock(&cec_notifiers_lock);
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  21=
7  	}
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  21=
8  =

f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05 @21=
9  	mutex_lock(&n->lock);
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  22=
0  	if (n->cec_adap) {
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  22=
1  		cec_phys_addr_invalidate(n->cec_adap);
f5dfc08548cf46 drivers/media/cec/cec-notifier.c Hans Verkuil 2020-03-05  22=
2  		cec_s_conn_info(n->cec_adap, &n->conn_info);
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  22=
3  	}
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  22=
4  	mutex_unlock(&n->lock);
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  22=
5  	return n;
b48cb35c6a7bab drivers/media/cec/cec-notifier.c Hans Verkuil 2019-06-20  22=
6  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1120704666134945297==--


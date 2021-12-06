Content-Type: multipart/mixed; boundary="===============6982932443219870327=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 99/235] drivers/usb/typec/port-mapper.c:168 typec_link_port() warn: missing error code 'ret'
Date: Tue, 07 Dec 2021 05:03:57 +0800
Message-ID: <202112070413.0XcllZat-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6982932443219870327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   055c73913dc220e483790c1ebf78b39f97220dac
commit: 98e43a40b551c910efd7c6afaa32b66c67d22dc4 [99/235] UPSTREAM: usb: ty=
pec: Port mapping utility
:::::: branch date: 11 days ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-m031-20211203 (https://download.01.org/0day-ci/ar=
chive/20211207/202112070413.0XcllZat-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/typec/port-mapper.c:168 typec_link_port() warn: missing error c=
ode 'ret'

vim +/ret +168 drivers/usb/typec/port-mapper.c

98e43a40b551c9 Heikki Krogerus 2021-04-07  146  =

98e43a40b551c9 Heikki Krogerus 2021-04-07  147  /**
98e43a40b551c9 Heikki Krogerus 2021-04-07  148   * typec_link_port - Link a=
 port to its connector
98e43a40b551c9 Heikki Krogerus 2021-04-07  149   * @port: The port device
98e43a40b551c9 Heikki Krogerus 2021-04-07  150   *
98e43a40b551c9 Heikki Krogerus 2021-04-07  151   * Find the connector of @p=
ort and create symlink named "connector" for it.
98e43a40b551c9 Heikki Krogerus 2021-04-07  152   * Returns 0 on success, or=
 errno in case of a failure.
98e43a40b551c9 Heikki Krogerus 2021-04-07  153   *
98e43a40b551c9 Heikki Krogerus 2021-04-07  154   * NOTE. The function incre=
ments the reference count of @port on success.
98e43a40b551c9 Heikki Krogerus 2021-04-07  155   */
98e43a40b551c9 Heikki Krogerus 2021-04-07  156  int typec_link_port(struct =
device *port)
98e43a40b551c9 Heikki Krogerus 2021-04-07  157  {
98e43a40b551c9 Heikki Krogerus 2021-04-07  158  	struct device *connector;
98e43a40b551c9 Heikki Krogerus 2021-04-07  159  	struct port_node *node;
98e43a40b551c9 Heikki Krogerus 2021-04-07  160  	int ret =3D 0;
98e43a40b551c9 Heikki Krogerus 2021-04-07  161  =

98e43a40b551c9 Heikki Krogerus 2021-04-07  162  	node =3D create_port_node(=
port);
98e43a40b551c9 Heikki Krogerus 2021-04-07  163  	if (IS_ERR(node))
98e43a40b551c9 Heikki Krogerus 2021-04-07  164  		return PTR_ERR(node);
98e43a40b551c9 Heikki Krogerus 2021-04-07  165  =

98e43a40b551c9 Heikki Krogerus 2021-04-07  166  	connector =3D find_connect=
or(node);
98e43a40b551c9 Heikki Krogerus 2021-04-07  167  	if (!connector)
98e43a40b551c9 Heikki Krogerus 2021-04-07 @168  		goto remove_node;
98e43a40b551c9 Heikki Krogerus 2021-04-07  169  =

98e43a40b551c9 Heikki Krogerus 2021-04-07  170  	ret =3D link_port(to_typec=
_port(connector), node);
98e43a40b551c9 Heikki Krogerus 2021-04-07  171  	if (ret)
98e43a40b551c9 Heikki Krogerus 2021-04-07  172  		goto put_connector;
98e43a40b551c9 Heikki Krogerus 2021-04-07  173  =

98e43a40b551c9 Heikki Krogerus 2021-04-07  174  	return 0;
98e43a40b551c9 Heikki Krogerus 2021-04-07  175  =

98e43a40b551c9 Heikki Krogerus 2021-04-07  176  put_connector:
98e43a40b551c9 Heikki Krogerus 2021-04-07  177  	put_device(connector);
98e43a40b551c9 Heikki Krogerus 2021-04-07  178  remove_node:
98e43a40b551c9 Heikki Krogerus 2021-04-07  179  	remove_port_node(node);
98e43a40b551c9 Heikki Krogerus 2021-04-07  180  =

98e43a40b551c9 Heikki Krogerus 2021-04-07  181  	return ret;
98e43a40b551c9 Heikki Krogerus 2021-04-07  182  }
98e43a40b551c9 Heikki Krogerus 2021-04-07  183  EXPORT_SYMBOL_GPL(typec_lin=
k_port);
98e43a40b551c9 Heikki Krogerus 2021-04-07  184  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6982932443219870327==--


Content-Type: multipart/mixed; boundary="===============7203726795023198881=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [pengutronix:v5.6/topic/tvp5150.12-media 5/18] drivers/media/v4l2-core/v4l2-fwnode.c:747 v4l2_fwnode_connector_add_link() warn: possible memory leak of 'link'
Date: Wed, 11 Mar 2020 17:36:57 +0300
Message-ID: <20200311143657.GE11561@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7203726795023198881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.pengutronix.de/git/linux-0-day v5.6/topic/tvp5150.12-me=
dia
head:   818c7a29eb379034bf0f85ff6a6b8c1b7203d17e
commit: 4c342a5cce960384eef333b906aa3d4207a7b7e7 [5/18] media: v4l2-fwnode:=
 add initial connector parsing support

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/v4l2-core/v4l2-fwnode.c:747 v4l2_fwnode_connector_add_link() =
warn: possible memory leak of 'link'

git remote add pengutronix https://git.pengutronix.de/git/linux-0-day
git remote update pengutronix
git checkout 4c342a5cce960384eef333b906aa3d4207a7b7e7
vim +/link +747 drivers/media/v4l2-core/v4l2-fwnode.c

4c342a5cce9603 Marco Felsch 2019-01-30  731  int v4l2_fwnode_connector_add_=
link(struct fwnode_handle *fwnode,
4c342a5cce9603 Marco Felsch 2019-01-30  732  				   struct v4l2_fwnode_conn=
ector *connector)
4c342a5cce9603 Marco Felsch 2019-01-30  733  {
4c342a5cce9603 Marco Felsch 2019-01-30  734  	struct fwnode_handle *connect=
or_ep;
4c342a5cce9603 Marco Felsch 2019-01-30  735  	struct v4l2_connector_link *l=
ink;
4c342a5cce9603 Marco Felsch 2019-01-30  736  	int err;
4c342a5cce9603 Marco Felsch 2019-01-30  737  =

4c342a5cce9603 Marco Felsch 2019-01-30  738  	if (!fwnode || !connector || =
connector->type =3D=3D V4L2_CONN_UNKNOWN)
4c342a5cce9603 Marco Felsch 2019-01-30  739  		return -EINVAL;
4c342a5cce9603 Marco Felsch 2019-01-30  740  =

4c342a5cce9603 Marco Felsch 2019-01-30  741  	link =3D kzalloc(sizeof(*link=
), GFP_KERNEL);
4c342a5cce9603 Marco Felsch 2019-01-30  742  	if (!link)
4c342a5cce9603 Marco Felsch 2019-01-30  743  		return -ENOMEM;
4c342a5cce9603 Marco Felsch 2019-01-30  744  =

4c342a5cce9603 Marco Felsch 2019-01-30  745  	connector_ep =3D fwnode_graph=
_get_remote_endpoint(fwnode);
4c342a5cce9603 Marco Felsch 2019-01-30  746  	if (!connector_ep)
4c342a5cce9603 Marco Felsch 2019-01-30 @747  		return -ENOTCONN;

kfree(link);

4c342a5cce9603 Marco Felsch 2019-01-30  748  =

4c342a5cce9603 Marco Felsch 2019-01-30  749  	err =3D v4l2_fwnode_parse_lin=
k(connector_ep, &link->fwnode_link);
4c342a5cce9603 Marco Felsch 2019-01-30  750  	if (err)
4c342a5cce9603 Marco Felsch 2019-01-30  751  		goto err;
4c342a5cce9603 Marco Felsch 2019-01-30  752  =

4c342a5cce9603 Marco Felsch 2019-01-30  753  	fwnode_handle_put(connector_e=
p);
4c342a5cce9603 Marco Felsch 2019-01-30  754  =

4c342a5cce9603 Marco Felsch 2019-01-30  755  	list_add(&link->head, &connec=
tor->links);
4c342a5cce9603 Marco Felsch 2019-01-30  756  	connector->nr_of_links++;
4c342a5cce9603 Marco Felsch 2019-01-30  757  =

4c342a5cce9603 Marco Felsch 2019-01-30  758  	return 0;
4c342a5cce9603 Marco Felsch 2019-01-30  759  =

4c342a5cce9603 Marco Felsch 2019-01-30  760  err:
4c342a5cce9603 Marco Felsch 2019-01-30  761  	kfree(link);
4c342a5cce9603 Marco Felsch 2019-01-30  762  	fwnode_handle_put(connector_e=
p);
4c342a5cce9603 Marco Felsch 2019-01-30  763  =

4c342a5cce9603 Marco Felsch 2019-01-30  764  	return err;
4c342a5cce9603 Marco Felsch 2019-01-30  765  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7203726795023198881==--


Content-Type: multipart/mixed; boundary="===============1949399395414549912=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [sashal-linux-stable:queue-4.19 18/54] drivers/block/rbd.c:5774:6: warning: The if condition is the same as the previous if condition [duplicateCondition]
Date: Wed, 22 Apr 2020 21:46:13 +0800
Message-ID: <202004222101.tJrrBJ3X%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1949399395414549912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Alexander Levin <alexander.levin@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git queue-4.19
head:   44b4f93224f7a85674bcf07baedad1691bd31916
commit: 6e05f6d895ce51f13744225a983f7adddcf78384 [18/54] rbd: avoid a deadl=
ock on header_rwsem when flushing notifies
:::::: branch date: 11 hours ago
:::::: commit date: 14 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/block/rbd.c:5774:6: warning: The if condition is the same as the=
 previous if condition [duplicateCondition]
    if (!depth)
        ^
   drivers/block/rbd.c:5761:6: note: First condition
    if (!depth) {
        ^
   drivers/block/rbd.c:5774:6: note: Second condition
    if (!depth)
        ^
   drivers/block/rbd.c:5829:6: warning: The if condition is the same as the=
 previous if condition [duplicateCondition]
    if (!depth)
        ^
   drivers/block/rbd.c:5827:6: note: First condition
    if (!depth)
        ^
   drivers/block/rbd.c:5829:6: note: Second condition
    if (!depth)
        ^
   drivers/block/rbd.c:1590:7: warning: Either the condition 'second' is re=
dundant or there is possible null pointer dereference: rbd_dev. [nullPointe=
rRedundantCheck]
    if (!rbd_dev->parent_spec)
         ^
   drivers/block/rbd.c:5971:10: note: Assuming that condition 'second' is n=
ot redundant
     while (second && (third =3D second->parent)) {
            ^
   drivers/block/rbd.c:5976:25: note: Calling function 'rbd_dev_image_relea=
se', 1st argument 'second' value is 0
     rbd_dev_image_release(second);
                           ^
   drivers/block/rbd.c:5726:18: note: Calling function 'rbd_dev_unprobe', 1=
st argument 'rbd_dev' value is 0
    rbd_dev_unprobe(rbd_dev);
                    ^
   drivers/block/rbd.c:5544:21: note: Calling function 'rbd_dev_parent_put'=
, 1st argument 'rbd_dev' value is 0
    rbd_dev_parent_put(rbd_dev);
                       ^
   drivers/block/rbd.c:1590:7: note: Null pointer dereference
    if (!rbd_dev->parent_spec)
         ^
   drivers/block/rbd.c:5727:6: warning: Either the condition 'second' is re=
dundant or there is possible null pointer dereference: rbd_dev. [nullPointe=
rRedundantCheck]
    if (rbd_dev->opts)
        ^
   drivers/block/rbd.c:5971:10: note: Assuming that condition 'second' is n=
ot redundant
     while (second && (third =3D second->parent)) {
            ^
   drivers/block/rbd.c:5976:25: note: Calling function 'rbd_dev_image_relea=
se', 1st argument 'second' value is 0
     rbd_dev_image_release(second);
                           ^
   drivers/block/rbd.c:5727:6: note: Null pointer dereference
    if (rbd_dev->opts)
        ^
   drivers/block/rbd.c:4635:1: warning: Label 'e_inval' is not used. [unuse=
dLabel]
   e_inval:
   ^
   drivers/block/rbd.c:4675:1: warning: Label 'e_inval' is not used. [unuse=
dLabel]
   e_inval:
   ^
   drivers/block/rbd.c:4713:1: warning: Label 'e_inval' is not used. [unuse=
dLabel]
   e_inval:
   ^

# https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/c=
ommit/?id=3D6e05f6d895ce51f13744225a983f7adddcf78384
git remote add sashal-linux-stable https://git.kernel.org/pub/scm/linux/ker=
nel/git/sashal/linux-stable.git
git remote update sashal-linux-stable
git checkout 6e05f6d895ce51f13744225a983f7adddcf78384
vim +5774 drivers/block/rbd.c

200a6a8be5dba9 Alex Elder   2013-04-28  5733  =

a30b71b999c920 Alex Elder   2012-07-10  5734  /*
a30b71b999c920 Alex Elder   2012-07-10  5735   * Probe for the existence of=
 the header object for the given rbd
1f3ef78861ac4b Alex Elder   2013-05-06  5736   * device.  If this image is =
the one being mapped (i.e., not a
1f3ef78861ac4b Alex Elder   2013-05-06  5737   * parent), initiate a watch =
on its header object before using that
1f3ef78861ac4b Alex Elder   2013-05-06  5738   * object to get detailed inf=
ormation about the rbd image.
6e05f6d895ce51 Ilya Dryomov 2020-03-13  5739   *
6e05f6d895ce51 Ilya Dryomov 2020-03-13  5740   * On success, returns with h=
eader_rwsem held for write if called
6e05f6d895ce51 Ilya Dryomov 2020-03-13  5741   * with @depth =3D=3D 0.
a30b71b999c920 Alex Elder   2012-07-10  5742   */
6d69bb536bac0d Ilya Dryomov 2015-10-11  5743  static int rbd_dev_image_prob=
e(struct rbd_device *rbd_dev, int depth)
a30b71b999c920 Alex Elder   2012-07-10  5744  {
a30b71b999c920 Alex Elder   2012-07-10  5745  	int ret;
a30b71b999c920 Alex Elder   2012-07-10  5746  =

a30b71b999c920 Alex Elder   2012-07-10  5747  	/*
3abef3b3585bbc Alex Elder   2013-05-13  5748  	 * Get the id from the image=
 id object.  Unless there's an
3abef3b3585bbc Alex Elder   2013-05-13  5749  	 * error, rbd_dev->spec->ima=
ge_id will be filled in with
3abef3b3585bbc Alex Elder   2013-05-13  5750  	 * a dynamically-allocated s=
tring, and rbd_dev->image_format
3abef3b3585bbc Alex Elder   2013-05-13  5751  	 * will be set to either 1 o=
r 2.
a30b71b999c920 Alex Elder   2012-07-10  5752  	 */
a30b71b999c920 Alex Elder   2012-07-10  5753  	ret =3D rbd_dev_image_id(rbd=
_dev);
a30b71b999c920 Alex Elder   2012-07-10  5754  	if (ret)
c0fba36880288a Alex Elder   2013-04-25  5755  		return ret;
c0fba36880288a Alex Elder   2013-04-25  5756  =

332bb12db9459d Alex Elder   2013-04-27  5757  	ret =3D rbd_dev_header_name(=
rbd_dev);
332bb12db9459d Alex Elder   2013-04-27  5758  	if (ret)
332bb12db9459d Alex Elder   2013-04-27  5759  		goto err_out_format;
332bb12db9459d Alex Elder   2013-04-27  5760  =

6d69bb536bac0d Ilya Dryomov 2015-10-11  5761  	if (!depth) {
99d1694310df3f Ilya Dryomov 2016-08-12  5762  		ret =3D rbd_register_watch(=
rbd_dev);
1fe480235ad723 Ilya Dryomov 2015-03-05  5763  		if (ret) {
1fe480235ad723 Ilya Dryomov 2015-03-05  5764  			if (ret =3D=3D -ENOENT)
b26c047b940003 Ilya Dryomov 2018-07-03  5765  				pr_info("image %s/%s%s%s =
does not exist\n",
1fe480235ad723 Ilya Dryomov 2015-03-05  5766  					rbd_dev->spec->pool_name,
b26c047b940003 Ilya Dryomov 2018-07-03  5767  					rbd_dev->spec->pool_ns ?=
: "",
b26c047b940003 Ilya Dryomov 2018-07-03  5768  					rbd_dev->spec->pool_ns ?=
 "/" : "",
1fe480235ad723 Ilya Dryomov 2015-03-05  5769  					rbd_dev->spec->image_nam=
e);
c41d13a31fefed Ilya Dryomov 2016-04-29  5770  			goto err_out_format;
1f3ef78861ac4b Alex Elder   2013-05-06  5771  		}
1fe480235ad723 Ilya Dryomov 2015-03-05  5772  	}
b644de2ba0c5b5 Alex Elder   2013-04-27  5773  =

6e05f6d895ce51 Ilya Dryomov 2020-03-13 @5774  	if (!depth)
6e05f6d895ce51 Ilya Dryomov 2020-03-13  5775  		down_write(&rbd_dev->header=
_rwsem);
6e05f6d895ce51 Ilya Dryomov 2020-03-13  5776  =

a720ae0901edda Ilya Dryomov 2014-07-23  5777  	ret =3D rbd_dev_header_info(=
rbd_dev);
5655c4d940ba8d Alex Elder   2013-04-25  5778  	if (ret)
b644de2ba0c5b5 Alex Elder   2013-04-27  5779  		goto err_out_watch;
a30b71b999c920 Alex Elder   2012-07-10  5780  =

0407759971cdbd Ilya Dryomov 2014-07-23  5781  	/*
0407759971cdbd Ilya Dryomov 2014-07-23  5782  	 * If this image is the one =
being mapped, we have pool name and
0407759971cdbd Ilya Dryomov 2014-07-23  5783  	 * id, image name and id, an=
d snap name - need to fill snap id.
0407759971cdbd Ilya Dryomov 2014-07-23  5784  	 * Otherwise this is a paren=
t image, identified by pool, image
0407759971cdbd Ilya Dryomov 2014-07-23  5785  	 * and snap ids - need to fi=
ll in names for those ids.
0407759971cdbd Ilya Dryomov 2014-07-23  5786  	 */
6d69bb536bac0d Ilya Dryomov 2015-10-11  5787  	if (!depth)
0407759971cdbd Ilya Dryomov 2014-07-23  5788  		ret =3D rbd_spec_fill_snap_=
id(rbd_dev);
0407759971cdbd Ilya Dryomov 2014-07-23  5789  	else
0407759971cdbd Ilya Dryomov 2014-07-23  5790  		ret =3D rbd_spec_fill_names=
(rbd_dev);
1fe480235ad723 Ilya Dryomov 2015-03-05  5791  	if (ret) {
1fe480235ad723 Ilya Dryomov 2015-03-05  5792  		if (ret =3D=3D -ENOENT)
b26c047b940003 Ilya Dryomov 2018-07-03  5793  			pr_info("snap %s/%s%s%s@%s=
 does not exist\n",
1fe480235ad723 Ilya Dryomov 2015-03-05  5794  				rbd_dev->spec->pool_name,
b26c047b940003 Ilya Dryomov 2018-07-03  5795  				rbd_dev->spec->pool_ns ?:=
 "",
b26c047b940003 Ilya Dryomov 2018-07-03  5796  				rbd_dev->spec->pool_ns ? =
"/" : "",
1fe480235ad723 Ilya Dryomov 2015-03-05  5797  				rbd_dev->spec->image_name,
1fe480235ad723 Ilya Dryomov 2015-03-05  5798  				rbd_dev->spec->snap_name);
33dca39f5c0c75 Alex Elder   2013-04-30  5799  		goto err_out_probe;
1fe480235ad723 Ilya Dryomov 2015-03-05  5800  	}
9bb81c9be90c1a Alex Elder   2013-04-27  5801  =

e8f59b595d05b7 Ilya Dryomov 2014-07-24  5802  	if (rbd_dev->header.features=
 & RBD_FEATURE_LAYERING) {
e8f59b595d05b7 Ilya Dryomov 2014-07-24  5803  		ret =3D rbd_dev_v2_parent_i=
nfo(rbd_dev);
e8f59b595d05b7 Ilya Dryomov 2014-07-24  5804  		if (ret)
e8f59b595d05b7 Ilya Dryomov 2014-07-24  5805  			goto err_out_probe;
e8f59b595d05b7 Ilya Dryomov 2014-07-24  5806  =

e8f59b595d05b7 Ilya Dryomov 2014-07-24  5807  		/*
e8f59b595d05b7 Ilya Dryomov 2014-07-24  5808  		 * Need to warn users if th=
is image is the one being
e8f59b595d05b7 Ilya Dryomov 2014-07-24  5809  		 * mapped and has a parent.
e8f59b595d05b7 Ilya Dryomov 2014-07-24  5810  		 */
6d69bb536bac0d Ilya Dryomov 2015-10-11  5811  		if (!depth && rbd_dev->pare=
nt_spec)
e8f59b595d05b7 Ilya Dryomov 2014-07-24  5812  			rbd_warn(rbd_dev,
e8f59b595d05b7 Ilya Dryomov 2014-07-24  5813  				 "WARNING: kernel layerin=
g is EXPERIMENTAL!");
e8f59b595d05b7 Ilya Dryomov 2014-07-24  5814  	}
e8f59b595d05b7 Ilya Dryomov 2014-07-24  5815  =

6d69bb536bac0d Ilya Dryomov 2015-10-11  5816  	ret =3D rbd_dev_probe_parent=
(rbd_dev, depth);
30d60ba2f258da Alex Elder   2013-05-06  5817  	if (ret)
30d60ba2f258da Alex Elder   2013-05-06  5818  		goto err_out_probe;
83a06263625b82 Alex Elder   2012-10-30  5819  =

30d60ba2f258da Alex Elder   2013-05-06  5820  	dout("discovered format %u i=
mage, header name is %s\n",
c41d13a31fefed Ilya Dryomov 2016-04-29  5821  		rbd_dev->image_format, rbd_=
dev->header_oid.name);
30d60ba2f258da Alex Elder   2013-05-06  5822  	return 0;
e8f59b595d05b7 Ilya Dryomov 2014-07-24  5823  =

6fd48b3be9f6d1 Alex Elder   2013-04-28  5824  err_out_probe:
6fd48b3be9f6d1 Alex Elder   2013-04-28  5825  	rbd_dev_unprobe(rbd_dev);
b644de2ba0c5b5 Alex Elder   2013-04-27  5826  err_out_watch:
6e05f6d895ce51 Ilya Dryomov 2020-03-13  5827  	if (!depth)
6e05f6d895ce51 Ilya Dryomov 2020-03-13  5828  		up_write(&rbd_dev->header_r=
wsem);
6d69bb536bac0d Ilya Dryomov 2015-10-11  5829  	if (!depth)
99d1694310df3f Ilya Dryomov 2016-08-12  5830  		rbd_unregister_watch(rbd_de=
v);
332bb12db9459d Alex Elder   2013-04-27  5831  err_out_format:
332bb12db9459d Alex Elder   2013-04-27  5832  	rbd_dev->image_format =3D 0;
5655c4d940ba8d Alex Elder   2013-04-25  5833  	kfree(rbd_dev->spec->image_i=
d);
5655c4d940ba8d Alex Elder   2013-04-25  5834  	rbd_dev->spec->image_id =3D =
NULL;
83a06263625b82 Alex Elder   2012-10-30  5835  	return ret;
83a06263625b82 Alex Elder   2012-10-30  5836  }
83a06263625b82 Alex Elder   2012-10-30  5837  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1949399395414549912==--


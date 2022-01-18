Content-Type: multipart/mixed; boundary="===============0512936005322200045=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-lib 11/24] fs/ceph/addr.c:1744:1: sparse: sparse: unused label 'out_put_folio'
Date: Tue, 18 Jan 2022 09:31:33 +0800
Message-ID: <202201180930.bBnJNcfG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0512936005322200045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-=
lib
head:   e450b62f32df4384c141a6a382811b3fe5723bad
commit: 11d90ed519237baca31d841a9a64fecdbc932f5a [11/24] ceph: Uninline the=
 data on a file opened for writing
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/202=
20118/202201180930.bBnJNcfG-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/11d90ed519237ba=
ca31d841a9a64fecdbc932f5a
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-lib
        git checkout 11d90ed519237baca31d841a9a64fecdbc932f5a
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash fs/ceph/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> fs/ceph/addr.c:1744:1: sparse: sparse: unused label 'out_put_folio'

vim +/out_put_folio +1744 fs/ceph/addr.c

31c542a199d79f Yan, Zheng    2014-11-14  1645  =

11d90ed519237b David Howells 2021-12-15  1646  int ceph_uninline_data(struc=
t file *file)
28127bdd2f843e Yan, Zheng    2014-11-14  1647  {
11d90ed519237b David Howells 2021-12-15  1648  	struct inode *inode =3D fil=
e_inode(file);
28127bdd2f843e Yan, Zheng    2014-11-14  1649  	struct ceph_inode_info *ci =
=3D ceph_inode(inode);
28127bdd2f843e Yan, Zheng    2014-11-14  1650  	struct ceph_fs_client *fsc =
=3D ceph_inode_to_client(inode);
28127bdd2f843e Yan, Zheng    2014-11-14  1651  	struct ceph_osd_request *re=
q;
11d90ed519237b David Howells 2021-12-15  1652  	struct folio *folio =3D NUL=
L;
11d90ed519237b David Howells 2021-12-15  1653  	struct page *pages[1];
28127bdd2f843e Yan, Zheng    2014-11-14  1654  	u64 len, inline_version;
28127bdd2f843e Yan, Zheng    2014-11-14  1655  	int err =3D 0;
11d90ed519237b David Howells 2021-12-15  1656  =

11d90ed519237b David Howells 2021-12-15  1657  	folio =3D read_mapping_foli=
o(inode->i_mapping, 0, file);
11d90ed519237b David Howells 2021-12-15  1658  	if (IS_ERR(folio)) {
11d90ed519237b David Howells 2021-12-15  1659  		err =3D PTR_ERR(folio);
11d90ed519237b David Howells 2021-12-15  1660  		goto out;
11d90ed519237b David Howells 2021-12-15  1661  	}
28127bdd2f843e Yan, Zheng    2014-11-14  1662  =

28127bdd2f843e Yan, Zheng    2014-11-14  1663  	spin_lock(&ci->i_ceph_lock);
28127bdd2f843e Yan, Zheng    2014-11-14  1664  	inline_version =3D ci->i_in=
line_version;
28127bdd2f843e Yan, Zheng    2014-11-14  1665  	spin_unlock(&ci->i_ceph_loc=
k);
28127bdd2f843e Yan, Zheng    2014-11-14  1666  =

28127bdd2f843e Yan, Zheng    2014-11-14  1667  	dout("uninline_data %p %llx=
.%llx inline_version %llu\n",
28127bdd2f843e Yan, Zheng    2014-11-14  1668  	     inode, ceph_vinop(inod=
e), inline_version);
28127bdd2f843e Yan, Zheng    2014-11-14  1669  =

28127bdd2f843e Yan, Zheng    2014-11-14  1670  	if (inline_version =3D=3D 1=
 || /* initial version, no data */
28127bdd2f843e Yan, Zheng    2014-11-14  1671  	    inline_version =3D=3D C=
EPH_INLINE_NONE)
11d90ed519237b David Howells 2021-12-15  1672  		goto out_unlock;
28127bdd2f843e Yan, Zheng    2014-11-14  1673  =

28127bdd2f843e Yan, Zheng    2014-11-14  1674  	len =3D i_size_read(inode);
11d90ed519237b David Howells 2021-12-15  1675  	if (len > folio_size(folio))
11d90ed519237b David Howells 2021-12-15  1676  		len =3D folio_size(folio);
28127bdd2f843e Yan, Zheng    2014-11-14  1677  =

28127bdd2f843e Yan, Zheng    2014-11-14  1678  	req =3D ceph_osdc_new_reque=
st(&fsc->client->osdc, &ci->i_layout,
28127bdd2f843e Yan, Zheng    2014-11-14  1679  				    ceph_vino(inode), 0,=
 &len, 0, 1,
54ea0046b6fe36 Ilya Dryomov  2017-02-11  1680  				    CEPH_OSD_OP_CREATE, =
CEPH_OSD_FLAG_WRITE,
34b759b4a22b0a Ilya Dryomov  2016-02-16  1681  				    NULL, 0, 0, false);
28127bdd2f843e Yan, Zheng    2014-11-14  1682  	if (IS_ERR(req)) {
28127bdd2f843e Yan, Zheng    2014-11-14  1683  		err =3D PTR_ERR(req);
11d90ed519237b David Howells 2021-12-15  1684  		goto out_unlock;
28127bdd2f843e Yan, Zheng    2014-11-14  1685  	}
28127bdd2f843e Yan, Zheng    2014-11-14  1686  =

fac02ddf910814 Arnd Bergmann 2018-07-13  1687  	req->r_mtime =3D inode->i_m=
time;
28127bdd2f843e Yan, Zheng    2014-11-14  1688  	err =3D ceph_osdc_start_req=
uest(&fsc->client->osdc, req, false);
28127bdd2f843e Yan, Zheng    2014-11-14  1689  	if (!err)
28127bdd2f843e Yan, Zheng    2014-11-14  1690  		err =3D ceph_osdc_wait_req=
uest(&fsc->client->osdc, req);
28127bdd2f843e Yan, Zheng    2014-11-14  1691  	ceph_osdc_put_request(req);
28127bdd2f843e Yan, Zheng    2014-11-14  1692  	if (err < 0)
11d90ed519237b David Howells 2021-12-15  1693  		goto out_unlock;
28127bdd2f843e Yan, Zheng    2014-11-14  1694  =

28127bdd2f843e Yan, Zheng    2014-11-14  1695  	req =3D ceph_osdc_new_reque=
st(&fsc->client->osdc, &ci->i_layout,
28127bdd2f843e Yan, Zheng    2014-11-14  1696  				    ceph_vino(inode), 0,=
 &len, 1, 3,
54ea0046b6fe36 Ilya Dryomov  2017-02-11  1697  				    CEPH_OSD_OP_WRITE, C=
EPH_OSD_FLAG_WRITE,
34b759b4a22b0a Ilya Dryomov  2016-02-16  1698  				    NULL, ci->i_truncate=
_seq,
34b759b4a22b0a Ilya Dryomov  2016-02-16  1699  				    ci->i_truncate_size,=
 false);
28127bdd2f843e Yan, Zheng    2014-11-14  1700  	if (IS_ERR(req)) {
28127bdd2f843e Yan, Zheng    2014-11-14  1701  		err =3D PTR_ERR(req);
11d90ed519237b David Howells 2021-12-15  1702  		goto out_unlock;
28127bdd2f843e Yan, Zheng    2014-11-14  1703  	}
28127bdd2f843e Yan, Zheng    2014-11-14  1704  =

11d90ed519237b David Howells 2021-12-15  1705  	pages[0] =3D folio_page(fol=
io, 0);
11d90ed519237b David Howells 2021-12-15  1706  	osd_req_op_extent_osd_data_=
pages(req, 1, pages, len, 0, false, false);
28127bdd2f843e Yan, Zheng    2014-11-14  1707  =

ec137c10e720e5 Yan, Zheng    2015-04-13  1708  	{
ec137c10e720e5 Yan, Zheng    2015-04-13  1709  		__le64 xattr_buf =3D cpu_t=
o_le64(inline_version);
28127bdd2f843e Yan, Zheng    2014-11-14  1710  		err =3D osd_req_op_xattr_i=
nit(req, 0, CEPH_OSD_OP_CMPXATTR,
ec137c10e720e5 Yan, Zheng    2015-04-13  1711  					    "inline_version", &=
xattr_buf,
ec137c10e720e5 Yan, Zheng    2015-04-13  1712  					    sizeof(xattr_buf),
28127bdd2f843e Yan, Zheng    2014-11-14  1713  					    CEPH_OSD_CMPXATTR_O=
P_GT,
28127bdd2f843e Yan, Zheng    2014-11-14  1714  					    CEPH_OSD_CMPXATTR_M=
ODE_U64);
28127bdd2f843e Yan, Zheng    2014-11-14  1715  		if (err)
11d90ed519237b David Howells 2021-12-15  1716  			goto out_put_req;
ec137c10e720e5 Yan, Zheng    2015-04-13  1717  	}
28127bdd2f843e Yan, Zheng    2014-11-14  1718  =

ec137c10e720e5 Yan, Zheng    2015-04-13  1719  	{
ec137c10e720e5 Yan, Zheng    2015-04-13  1720  		char xattr_buf[32];
ec137c10e720e5 Yan, Zheng    2015-04-13  1721  		int xattr_len =3D snprintf=
(xattr_buf, sizeof(xattr_buf),
ec137c10e720e5 Yan, Zheng    2015-04-13  1722  					 "%llu", inline_version=
);
28127bdd2f843e Yan, Zheng    2014-11-14  1723  		err =3D osd_req_op_xattr_i=
nit(req, 2, CEPH_OSD_OP_SETXATTR,
ec137c10e720e5 Yan, Zheng    2015-04-13  1724  					    "inline_version",
ec137c10e720e5 Yan, Zheng    2015-04-13  1725  					    xattr_buf, xattr_le=
n, 0, 0);
28127bdd2f843e Yan, Zheng    2014-11-14  1726  		if (err)
11d90ed519237b David Howells 2021-12-15  1727  			goto out_put_req;
ec137c10e720e5 Yan, Zheng    2015-04-13  1728  	}
28127bdd2f843e Yan, Zheng    2014-11-14  1729  =

fac02ddf910814 Arnd Bergmann 2018-07-13  1730  	req->r_mtime =3D inode->i_m=
time;
28127bdd2f843e Yan, Zheng    2014-11-14  1731  	err =3D ceph_osdc_start_req=
uest(&fsc->client->osdc, req, false);
28127bdd2f843e Yan, Zheng    2014-11-14  1732  	if (!err)
28127bdd2f843e Yan, Zheng    2014-11-14  1733  		err =3D ceph_osdc_wait_req=
uest(&fsc->client->osdc, req);
97e27aaa9a2cbd Xiubo Li      2020-03-19  1734  =

8ae99ae2b40766 Xiubo Li      2021-03-22  1735  	ceph_update_write_metrics(&=
fsc->mdsc->metric, req->r_start_latency,
903f4fec78dd05 Xiubo Li      2021-05-13  1736  				  req->r_end_latency, le=
n, err);
97e27aaa9a2cbd Xiubo Li      2020-03-19  1737  =

11d90ed519237b David Howells 2021-12-15  1738  out_put_req:
28127bdd2f843e Yan, Zheng    2014-11-14  1739  	ceph_osdc_put_request(req);
28127bdd2f843e Yan, Zheng    2014-11-14  1740  	if (err =3D=3D -ECANCELED)
28127bdd2f843e Yan, Zheng    2014-11-14  1741  		err =3D 0;
11d90ed519237b David Howells 2021-12-15  1742  out_unlock:
11d90ed519237b David Howells 2021-12-15  1743  	folio_unlock(folio);
11d90ed519237b David Howells 2021-12-15 @1744  out_put_folio:
11d90ed519237b David Howells 2021-12-15  1745  	folio_put(folio);
28127bdd2f843e Yan, Zheng    2014-11-14  1746  out:
28127bdd2f843e Yan, Zheng    2014-11-14  1747  	dout("uninline_data %p %llx=
.%llx inline_version %llu =3D %d\n",
28127bdd2f843e Yan, Zheng    2014-11-14  1748  	     inode, ceph_vinop(inod=
e), inline_version, err);
28127bdd2f843e Yan, Zheng    2014-11-14  1749  	return err;
28127bdd2f843e Yan, Zheng    2014-11-14  1750  }
28127bdd2f843e Yan, Zheng    2014-11-14  1751  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0512936005322200045==--


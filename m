Content-Type: multipart/mixed; boundary="===============2121523607865689805=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1745/9897] drivers/net/dsa/ocelot/felix_vsc9959.c:1855:22-25: ERROR: reference preceded by free on line 1865
Date: Wed, 29 Dec 2021 16:08:08 +0800
Message-ID: <202112291628.atuayxKa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2121523607865689805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ea586a076e8aa606c59b66d86660590f18354b11
commit: 23ae3a7877718931474684ef4fbbaf1d1511ee84 [1745/9897] net: dsa: feli=
x: add stream gate settings for psfp
:::::: branch date: 5 days ago
:::::: commit date: 6 weeks ago
config: powerpc-randconfig-c004-20211228 (https://download.01.org/0day-ci/a=
rchive/20211229/202112291628.atuayxKa-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/dsa/ocelot/felix_vsc9959.c:1855:22-25: ERROR: reference prec=
eded by free on line 1865

vim +1855 drivers/net/dsa/ocelot/felix_vsc9959.c

7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1831  =

7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1832  static int vsc9959_psfp_fil=
ter_add(struct ocelot *ocelot,
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1833  				   struct flow_cls_offl=
oad *f)
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1834  {
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1835  	struct netlink_ext_ack *ex=
tack =3D f->common.extack;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1836  	struct felix_stream_filter=
 sfi =3D {0};
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1837  	const struct flow_action_e=
ntry *a;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1838  	struct felix_stream *strea=
m_entry;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1839  	struct felix_stream stream=
 =3D {0};
23ae3a78777189 Xiaoliang Yang 2021-11-18  1840  	struct felix_stream_gate *=
sgi;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1841  	struct ocelot_psfp_list *p=
sfp;
23ae3a78777189 Xiaoliang Yang 2021-11-18  1842  	int ret, i, size;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1843  =

7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1844  	psfp =3D &ocelot->psfp;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1845  =

7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1846  	ret =3D vsc9959_stream_ide=
ntify(f, &stream);
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1847  	if (ret) {
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1848  		NL_SET_ERR_MSG_MOD(extack=
, "Only can match on VID, PCP, and dest MAC");
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1849  		return ret;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1850  	}
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1851  =

7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1852  	flow_action_for_each(i, a,=
 &f->rule->action) {
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1853  		switch (a->id) {
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1854  		case FLOW_ACTION_GATE:
23ae3a78777189 Xiaoliang Yang 2021-11-18 @1855  			size =3D struct_size(sgi=
, entries, a->gate.num_entries);
23ae3a78777189 Xiaoliang Yang 2021-11-18  1856  			sgi =3D kzalloc(size, GF=
P_KERNEL);
23ae3a78777189 Xiaoliang Yang 2021-11-18  1857  			vsc9959_psfp_parse_gate(=
a, sgi);
23ae3a78777189 Xiaoliang Yang 2021-11-18  1858  			ret =3D vsc9959_psfp_sgi=
_table_add(ocelot, sgi);
23ae3a78777189 Xiaoliang Yang 2021-11-18  1859  			if (ret) {
23ae3a78777189 Xiaoliang Yang 2021-11-18  1860  				kfree(sgi);
23ae3a78777189 Xiaoliang Yang 2021-11-18  1861  				return ret;
23ae3a78777189 Xiaoliang Yang 2021-11-18  1862  			}
23ae3a78777189 Xiaoliang Yang 2021-11-18  1863  			sfi.sg_valid =3D 1;
23ae3a78777189 Xiaoliang Yang 2021-11-18  1864  			sfi.sgid =3D sgi->index;
23ae3a78777189 Xiaoliang Yang 2021-11-18 @1865  			kfree(sgi);
23ae3a78777189 Xiaoliang Yang 2021-11-18  1866  			break;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1867  		case FLOW_ACTION_POLICE:
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1868  		default:
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1869  			return -EOPNOTSUPP;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1870  		}
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1871  	}
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1872  =

7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1873  	/* Check if stream is set.=
 */
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1874  	stream_entry =3D vsc9959_s=
tream_table_lookup(&psfp->stream_list, &stream);
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1875  	if (stream_entry) {
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1876  		NL_SET_ERR_MSG_MOD(extack=
, "This stream is already added");
23ae3a78777189 Xiaoliang Yang 2021-11-18  1877  		ret =3D -EEXIST;
23ae3a78777189 Xiaoliang Yang 2021-11-18  1878  		goto err;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1879  	}
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1880  =

7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1881  	sfi.prio_valid =3D (stream=
.prio < 0 ? 0 : 1);
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1882  	sfi.prio =3D (sfi.prio_val=
id ? stream.prio : 0);
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1883  	sfi.enable =3D 1;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1884  =

7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1885  	ret =3D vsc9959_psfp_sfi_t=
able_add(ocelot, &sfi);
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1886  	if (ret)
23ae3a78777189 Xiaoliang Yang 2021-11-18  1887  		goto err;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1888  =

7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1889  	stream.sfid =3D sfi.index;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1890  	stream.sfid_valid =3D 1;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1891  	ret =3D vsc9959_stream_tab=
le_add(ocelot, &psfp->stream_list,
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1892  				       &stream, extack);
23ae3a78777189 Xiaoliang Yang 2021-11-18  1893  	if (ret) {
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1894  		vsc9959_psfp_sfi_table_de=
l(ocelot, stream.sfid);
23ae3a78777189 Xiaoliang Yang 2021-11-18  1895  		goto err;
23ae3a78777189 Xiaoliang Yang 2021-11-18  1896  	}
23ae3a78777189 Xiaoliang Yang 2021-11-18  1897  =

23ae3a78777189 Xiaoliang Yang 2021-11-18  1898  	return 0;
23ae3a78777189 Xiaoliang Yang 2021-11-18  1899  =

23ae3a78777189 Xiaoliang Yang 2021-11-18  1900  err:
23ae3a78777189 Xiaoliang Yang 2021-11-18  1901  	if (sfi.sg_valid)
23ae3a78777189 Xiaoliang Yang 2021-11-18  1902  		vsc9959_psfp_sgi_table_de=
l(ocelot, sfi.sgid);
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1903  =

7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1904  	return ret;
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1905  }
7d4b564d6adde3 Xiaoliang Yang 2021-11-18  1906  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2121523607865689805==--


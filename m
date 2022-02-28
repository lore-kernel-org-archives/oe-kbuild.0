Content-Type: multipart/mixed; boundary="===============3296960731898830409=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] scsi: libsas: cleanup sas_form_port()
Date: Tue, 01 Mar 2022 04:20:05 +0800
Message-ID: <202203010428.5Gka1xt4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3296960731898830409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220228094857.557329-1-damien.lemoal@opensource.wdc.com>
References: <20220228094857.557329-1-damien.lemoal@opensource.wdc.com>
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
TO: linux-scsi(a)vger.kernel.org
TO: "Martin K . Petersen" <martin.petersen@oracle.com>
TO: John Garry <john.garry@huawei.com>
TO: Dan Carpenter <error27@gmail.com>
TO: Jason Yan <yanaijie@huawei.com>

Hi Damien,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next v5.17-rc6 next-20220225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Damien-Le-Moal/scsi-libsas=
-cleanup-sas_form_port/20220228-175040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-n=
ext
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-m001-20220228 (https://download.01.org/0day-ci/ar=
chive/20220301/202203010428.5Gka1xt4-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/scsi/libsas/sas_port.c:172 sas_form_port() error: we previously ass=
umed 'port' could be null (see line 115)

vim +/port +172 drivers/scsi/libsas/sas_port.c

2da00b1cacb2885 Damien Le Moal  2022-02-28   97  =

2908d778ab3e244 James Bottomley 2006-08-29   98  /**
121246ae93a1ef3 Bart Van Assche 2018-02-22   99   * sas_form_port - add thi=
s phy to a port
2908d778ab3e244 James Bottomley 2006-08-29  100   * @phy: the phy of intere=
st
2908d778ab3e244 James Bottomley 2006-08-29  101   *
2908d778ab3e244 James Bottomley 2006-08-29  102   * This function adds this=
 phy to an existing port, thus creating a wide
2908d778ab3e244 James Bottomley 2006-08-29  103   * port, or it creates a p=
ort and adds the phy to the port.
2908d778ab3e244 James Bottomley 2006-08-29  104   */
2908d778ab3e244 James Bottomley 2006-08-29  105  static void sas_form_port(=
struct asd_sas_phy *phy)
2908d778ab3e244 James Bottomley 2006-08-29  106  {
2908d778ab3e244 James Bottomley 2006-08-29  107  	int i;
2908d778ab3e244 James Bottomley 2006-08-29  108  	struct sas_ha_struct *sas=
_ha =3D phy->ha;
2908d778ab3e244 James Bottomley 2006-08-29  109  	struct asd_sas_port *port=
 =3D phy->port;
2da00b1cacb2885 Damien Le Moal  2022-02-28  110  	struct domain_device *por=
t_dev =3D NULL;
2908d778ab3e244 James Bottomley 2006-08-29  111  	struct sas_internal *si =
=3D
2908d778ab3e244 James Bottomley 2006-08-29  112  		to_sas_internal(sas_ha->=
core.shost->transportt);
980fa2f9d64b9be Darrick J. Wong 2007-01-11  113  	unsigned long flags;
2908d778ab3e244 James Bottomley 2006-08-29  114  =

2908d778ab3e244 James Bottomley 2006-08-29 @115  	if (port) {
00f0254ed9b1916 Dan Williams    2010-10-01  116  		if (!phy_is_wideport_mem=
ber(port, phy))
90f1e10d08bad84 Dan Williams    2011-05-24  117  			sas_deform_port(phy, 0);
303694eeee5eaca Dan Williams    2012-06-21  118  		else if (phy->suspended)=
 {
303694eeee5eaca Dan Williams    2012-06-21  119  			phy->suspended =3D 0;
303694eeee5eaca Dan Williams    2012-06-21  120  			sas_resume_port(phy);
303694eeee5eaca Dan Williams    2012-06-21  121  =

303694eeee5eaca Dan Williams    2012-06-21  122  			/* phy came back, try t=
o cancel the timeout */
303694eeee5eaca Dan Williams    2012-06-21  123  			wake_up(&sas_ha->eh_wai=
t_q);
303694eeee5eaca Dan Williams    2012-06-21  124  			return;
303694eeee5eaca Dan Williams    2012-06-21  125  		} else {
15ba7806c316ce8 John Garry      2018-11-15  126  			pr_info("%s: phy%d belo=
ngs to port%d already(%d)!\n",
cadbd4a5e36dde7 Harvey Harrison 2008-07-03  127  				__func__, phy->id, phy=
->port->id,
2908d778ab3e244 James Bottomley 2006-08-29  128  				phy->port->num_phys);
2908d778ab3e244 James Bottomley 2006-08-29  129  			return;
2908d778ab3e244 James Bottomley 2006-08-29  130  		}
2908d778ab3e244 James Bottomley 2006-08-29  131  	}
2908d778ab3e244 James Bottomley 2006-08-29  132  =

5381837f125cc62 Tom Peng        2009-07-01  133  	/* see if the phy should =
be part of a wide port */
980fa2f9d64b9be Darrick J. Wong 2007-01-11  134  	spin_lock_irqsave(&sas_ha=
->phy_port_lock, flags);
2908d778ab3e244 James Bottomley 2006-08-29  135  	for (i =3D 0; i < sas_ha-=
>num_phys; i++) {
2908d778ab3e244 James Bottomley 2006-08-29  136  		port =3D sas_ha->sas_por=
t[i];
2908d778ab3e244 James Bottomley 2006-08-29  137  		spin_lock(&port->phy_lis=
t_lock);
2908d778ab3e244 James Bottomley 2006-08-29  138  		if (*(u64 *) port->sas_a=
ddr &&
00f0254ed9b1916 Dan Williams    2010-10-01  139  		    phy_is_wideport_memb=
er(port, phy) && port->num_phys > 0) {
2908d778ab3e244 James Bottomley 2006-08-29  140  			/* wide port */
2da00b1cacb2885 Damien Le Moal  2022-02-28  141  			port_dev =3D port->port=
_dev;
2da00b1cacb2885 Damien Le Moal  2022-02-28  142  			sas_form_port_add_phy(p=
ort, phy, true);
2da00b1cacb2885 Damien Le Moal  2022-02-28  143  			spin_unlock(&port->phy_=
list_lock);
2908d778ab3e244 James Bottomley 2006-08-29  144  			break;
5381837f125cc62 Tom Peng        2009-07-01  145  		}
5381837f125cc62 Tom Peng        2009-07-01  146  		spin_unlock(&port->phy_l=
ist_lock);
5381837f125cc62 Tom Peng        2009-07-01  147  	}
5381837f125cc62 Tom Peng        2009-07-01  148  	/* The phy does not match=
 any existing port, create a new one */
5381837f125cc62 Tom Peng        2009-07-01  149  	if (i =3D=3D sas_ha->num_=
phys) {
5381837f125cc62 Tom Peng        2009-07-01  150  		for (i =3D 0; i < sas_ha=
->num_phys; i++) {
5381837f125cc62 Tom Peng        2009-07-01  151  			port =3D sas_ha->sas_po=
rt[i];
5381837f125cc62 Tom Peng        2009-07-01  152  			spin_lock(&port->phy_li=
st_lock);
5381837f125cc62 Tom Peng        2009-07-01  153  			if (*(u64 *)port->sas_a=
ddr =3D=3D 0
5381837f125cc62 Tom Peng        2009-07-01  154  			    && port->num_phys =
=3D=3D 0) {
2da00b1cacb2885 Damien Le Moal  2022-02-28  155  				port_dev =3D port->por=
t_dev;
2da00b1cacb2885 Damien Le Moal  2022-02-28  156  				sas_form_port_add_phy(=
port, phy, false);
2da00b1cacb2885 Damien Le Moal  2022-02-28  157  				spin_unlock(&port->phy=
_list_lock);
2908d778ab3e244 James Bottomley 2006-08-29  158  				break;
2908d778ab3e244 James Bottomley 2006-08-29  159  			}
2908d778ab3e244 James Bottomley 2006-08-29  160  			spin_unlock(&port->phy_=
list_lock);
2908d778ab3e244 James Bottomley 2006-08-29  161  		}
2908d778ab3e244 James Bottomley 2006-08-29  162  =

2908d778ab3e244 James Bottomley 2006-08-29  163  		if (i >=3D sas_ha->num_p=
hys) {
2da00b1cacb2885 Damien Le Moal  2022-02-28  164  			pr_err("%s: couldn't fi=
nd a free port, bug?\n",
2da00b1cacb2885 Damien Le Moal  2022-02-28  165  			       __func__);
980fa2f9d64b9be Darrick J. Wong 2007-01-11  166  			spin_unlock_irqrestore(=
&sas_ha->phy_port_lock, flags);
2908d778ab3e244 James Bottomley 2006-08-29  167  			return;
2908d778ab3e244 James Bottomley 2006-08-29  168  		}
2da00b1cacb2885 Damien Le Moal  2022-02-28  169  	}
980fa2f9d64b9be Darrick J. Wong 2007-01-11  170  	spin_unlock_irqrestore(&s=
as_ha->phy_port_lock, flags);
2908d778ab3e244 James Bottomley 2006-08-29  171  =

2908d778ab3e244 James Bottomley 2006-08-29 @172  	if (!port->port) {
b4698d88585e23d Dan Williams    2012-04-19  173  		port->port =3D sas_port_=
alloc(phy->phy->dev.parent, port->id);
2908d778ab3e244 James Bottomley 2006-08-29  174  		BUG_ON(!port->port);
2908d778ab3e244 James Bottomley 2006-08-29  175  		sas_port_add(port->port);
2908d778ab3e244 James Bottomley 2006-08-29  176  	}
2908d778ab3e244 James Bottomley 2006-08-29  177  	sas_port_add_phy(port->po=
rt, phy->phy);
2908d778ab3e244 James Bottomley 2006-08-29  178  =

b3e3d4c618c5b97 John Garry      2019-12-19  179  	pr_debug("%s added to %s,=
 phy_mask:0x%x (%016llx)\n",
71610f55fa4db63 Kay Sievers     2008-12-03  180  		 dev_name(&phy->phy->dev=
), dev_name(&port->port->dev),
a29c05153630b2c James Bottomley 2008-02-23  181  		 port->phy_mask,
a29c05153630b2c James Bottomley 2008-02-23  182  		 SAS_ADDR(port->attached=
_sas_addr));
a29c05153630b2c James Bottomley 2008-02-23  183  =

085f104a83d5650 John Garry      2019-04-12  184  	if (port_dev)
085f104a83d5650 John Garry      2019-04-12  185  		port_dev->pathways =3D p=
ort->num_phys;
2908d778ab3e244 James Bottomley 2006-08-29  186  =

2908d778ab3e244 James Bottomley 2006-08-29  187  	/* Tell the LLDD about th=
is port formation. */
2908d778ab3e244 James Bottomley 2006-08-29  188  	if (si->dft->lldd_port_fo=
rmed)
2908d778ab3e244 James Bottomley 2006-08-29  189  		si->dft->lldd_port_forme=
d(phy);
2908d778ab3e244 James Bottomley 2006-08-29  190  =

2908d778ab3e244 James Bottomley 2006-08-29  191  	sas_discover_event(phy->p=
ort, DISCE_DISCOVER_DOMAIN);
085f104a83d5650 John Garry      2019-04-12  192  	/* Only insert a revalida=
te event after initial discovery */
924a3541eab0d28 John Garry      2019-06-10  193  	if (port_dev && dev_is_ex=
pander(port_dev->dev_type)) {
085f104a83d5650 John Garry      2019-04-12  194  		struct expander_device *=
ex_dev =3D &port_dev->ex_dev;
085f104a83d5650 John Garry      2019-04-12  195  =

085f104a83d5650 John Garry      2019-04-12  196  		ex_dev->ex_change_count =
=3D -1;
085f104a83d5650 John Garry      2019-04-12  197  		sas_discover_event(port,=
 DISCE_REVALIDATE_DOMAIN);
085f104a83d5650 John Garry      2019-04-12  198  	}
517e5153d242cb2 Jason Yan       2017-12-08  199  	flush_workqueue(sas_ha->d=
isco_q);
2908d778ab3e244 James Bottomley 2006-08-29  200  }
2908d778ab3e244 James Bottomley 2006-08-29  201  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3296960731898830409==--


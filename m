Content-Type: multipart/mixed; boundary="===============5957196127797388606=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/libsas/sas_port.c:172:18: warning: dereference of NULL 'port' [CWE-476]
Date: Sun, 19 Jun 2022 15:18:24 +0800
Message-ID: <202206191546.QgaGOq93-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5957196127797388606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/s=
csi/libsas/sas_port.c:172:18: warning: dereference of NULL 'port' [CWE-476]=
 [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: John Garry <john.garry@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 32698c955295957d63f042f4bb30e9d613ca8b55 scsi: libsas: Clean up sas=
_form_port()
date:   4 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220619 (https://download.01.org/0day-ci/archi=
ve/20220619/202206191546.QgaGOq93-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D32698c955295957d63f042f4bb30e9d613ca8b55
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 32698c955295957d63f042f4bb30e9d613ca8b55
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   include/linux/spinlock.h: In function 'sas_form_port':
>> drivers/scsi/libsas/sas_port.c:172:18: warning: dereference of NULL 'por=
t' [CWE-476] [-Wanalyzer-null-dereference]
     172 |         if (!port->port) {
         |              ~~~~^~~~~~
     'sas_form_port': event 1
       |
       |  115 |         if (port) {
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch (when 'port' is NUL=
L)...
       |
     'sas_form_port': event 2
       |
       |include/linux/spinlock.h:324:16:
       |  324 |         return &lock->rlock;
       |      |                ^~~~~~~~~~~~
       |      |                |
       |      |                (2) ...to here
       |
     'sas_form_port': events 3-5
       |
       |drivers/scsi/libsas/sas_port.c:135:23:
       |  135 |         for (i =3D 0; i < sas_ha->num_phys; i++) {
       |      |                     ~~^~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (3) following 'false' branch...
       |......
       |  149 |         if (i =3D=3D sas_ha->num_phys) {
       |      |            ~     ~~~~~~~~~~~~~~~~
       |      |            |           |
       |      |            |           (4) ...to here
       |      |            (5) following 'false' branch...
       |
     'sas_form_port': event 6
       |
       |include/linux/spinlock.h:280:17:
       |  280 |                 _raw_spin_unlock_irqrestore(lock, flags);  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (6) ...to here
   include/linux/spinlock.h:404:9: note: in expansion of macro 'raw_spin_un=
lock_irqrestore'
       |  404 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'sas_form_port': event 7
       |
       |drivers/scsi/libsas/sas_port.c:172:18:
       |  172 |         if (!port->port) {
       |      |              ~~~~^~~~~~
       |      |                  |
       |      |                  (7) dereference of NULL 'port'
       |

vim +/port +172 drivers/scsi/libsas/sas_port.c

32698c95529595 Damien Le Moal  2022-02-28   97  =

2908d778ab3e24 James Bottomley 2006-08-29   98  /**
121246ae93a1ef Bart Van Assche 2018-02-22   99   * sas_form_port - add this=
 phy to a port
2908d778ab3e24 James Bottomley 2006-08-29  100   * @phy: the phy of interest
2908d778ab3e24 James Bottomley 2006-08-29  101   *
2908d778ab3e24 James Bottomley 2006-08-29  102   * This function adds this =
phy to an existing port, thus creating a wide
2908d778ab3e24 James Bottomley 2006-08-29  103   * port, or it creates a po=
rt and adds the phy to the port.
2908d778ab3e24 James Bottomley 2006-08-29  104   */
2908d778ab3e24 James Bottomley 2006-08-29  105  static void sas_form_port(s=
truct asd_sas_phy *phy)
2908d778ab3e24 James Bottomley 2006-08-29  106  {
2908d778ab3e24 James Bottomley 2006-08-29  107  	int i;
2908d778ab3e24 James Bottomley 2006-08-29  108  	struct sas_ha_struct *sas_=
ha =3D phy->ha;
2908d778ab3e24 James Bottomley 2006-08-29  109  	struct asd_sas_port *port =
=3D phy->port;
32698c95529595 Damien Le Moal  2022-02-28  110  	struct domain_device *port=
_dev =3D NULL;
2908d778ab3e24 James Bottomley 2006-08-29  111  	struct sas_internal *si =
=3D
2908d778ab3e24 James Bottomley 2006-08-29  112  		to_sas_internal(sas_ha->c=
ore.shost->transportt);
980fa2f9d64b9b Darrick J. Wong 2007-01-11  113  	unsigned long flags;
2908d778ab3e24 James Bottomley 2006-08-29  114  =

2908d778ab3e24 James Bottomley 2006-08-29  115  	if (port) {
00f0254ed9b191 Dan Williams    2010-10-01  116  		if (!phy_is_wideport_memb=
er(port, phy))
90f1e10d08bad8 Dan Williams    2011-05-24  117  			sas_deform_port(phy, 0);
303694eeee5eac Dan Williams    2012-06-21  118  		else if (phy->suspended) {
303694eeee5eac Dan Williams    2012-06-21  119  			phy->suspended =3D 0;
303694eeee5eac Dan Williams    2012-06-21  120  			sas_resume_port(phy);
303694eeee5eac Dan Williams    2012-06-21  121  =

303694eeee5eac Dan Williams    2012-06-21  122  			/* phy came back, try to=
 cancel the timeout */
303694eeee5eac Dan Williams    2012-06-21  123  			wake_up(&sas_ha->eh_wait=
_q);
303694eeee5eac Dan Williams    2012-06-21  124  			return;
303694eeee5eac Dan Williams    2012-06-21  125  		} else {
15ba7806c316ce John Garry      2018-11-15  126  			pr_info("%s: phy%d belon=
gs to port%d already(%d)!\n",
cadbd4a5e36dde Harvey Harrison 2008-07-03  127  				__func__, phy->id, phy-=
>port->id,
2908d778ab3e24 James Bottomley 2006-08-29  128  				phy->port->num_phys);
2908d778ab3e24 James Bottomley 2006-08-29  129  			return;
2908d778ab3e24 James Bottomley 2006-08-29  130  		}
2908d778ab3e24 James Bottomley 2006-08-29  131  	}
2908d778ab3e24 James Bottomley 2006-08-29  132  =

5381837f125cc6 Tom Peng        2009-07-01  133  	/* see if the phy should b=
e part of a wide port */
980fa2f9d64b9b Darrick J. Wong 2007-01-11  134  	spin_lock_irqsave(&sas_ha-=
>phy_port_lock, flags);
2908d778ab3e24 James Bottomley 2006-08-29  135  	for (i =3D 0; i < sas_ha->=
num_phys; i++) {
2908d778ab3e24 James Bottomley 2006-08-29  136  		port =3D sas_ha->sas_port=
[i];
2908d778ab3e24 James Bottomley 2006-08-29  137  		spin_lock(&port->phy_list=
_lock);
2908d778ab3e24 James Bottomley 2006-08-29  138  		if (*(u64 *) port->sas_ad=
dr &&
00f0254ed9b191 Dan Williams    2010-10-01  139  		    phy_is_wideport_membe=
r(port, phy) && port->num_phys > 0) {
2908d778ab3e24 James Bottomley 2006-08-29  140  			/* wide port */
32698c95529595 Damien Le Moal  2022-02-28  141  			port_dev =3D port->port_=
dev;
32698c95529595 Damien Le Moal  2022-02-28  142  			sas_form_port_add_phy(po=
rt, phy, true);
32698c95529595 Damien Le Moal  2022-02-28  143  			spin_unlock(&port->phy_l=
ist_lock);
2908d778ab3e24 James Bottomley 2006-08-29  144  			break;
5381837f125cc6 Tom Peng        2009-07-01  145  		}
5381837f125cc6 Tom Peng        2009-07-01  146  		spin_unlock(&port->phy_li=
st_lock);
5381837f125cc6 Tom Peng        2009-07-01  147  	}
5381837f125cc6 Tom Peng        2009-07-01  148  	/* The phy does not match =
any existing port, create a new one */
5381837f125cc6 Tom Peng        2009-07-01  149  	if (i =3D=3D sas_ha->num_p=
hys) {
5381837f125cc6 Tom Peng        2009-07-01  150  		for (i =3D 0; i < sas_ha-=
>num_phys; i++) {
5381837f125cc6 Tom Peng        2009-07-01  151  			port =3D sas_ha->sas_por=
t[i];
5381837f125cc6 Tom Peng        2009-07-01  152  			spin_lock(&port->phy_lis=
t_lock);
5381837f125cc6 Tom Peng        2009-07-01  153  			if (*(u64 *)port->sas_ad=
dr =3D=3D 0
5381837f125cc6 Tom Peng        2009-07-01  154  			    && port->num_phys =
=3D=3D 0) {
32698c95529595 Damien Le Moal  2022-02-28  155  				port_dev =3D port->port=
_dev;
32698c95529595 Damien Le Moal  2022-02-28  156  				sas_form_port_add_phy(p=
ort, phy, false);
32698c95529595 Damien Le Moal  2022-02-28  157  				spin_unlock(&port->phy_=
list_lock);
2908d778ab3e24 James Bottomley 2006-08-29  158  				break;
2908d778ab3e24 James Bottomley 2006-08-29  159  			}
2908d778ab3e24 James Bottomley 2006-08-29  160  			spin_unlock(&port->phy_l=
ist_lock);
2908d778ab3e24 James Bottomley 2006-08-29  161  		}
2908d778ab3e24 James Bottomley 2006-08-29  162  =

2908d778ab3e24 James Bottomley 2006-08-29  163  		if (i >=3D sas_ha->num_ph=
ys) {
32698c95529595 Damien Le Moal  2022-02-28  164  			pr_err("%s: couldn't fin=
d a free port, bug?\n",
32698c95529595 Damien Le Moal  2022-02-28  165  			       __func__);
980fa2f9d64b9b Darrick J. Wong 2007-01-11  166  			spin_unlock_irqrestore(&=
sas_ha->phy_port_lock, flags);
2908d778ab3e24 James Bottomley 2006-08-29  167  			return;
2908d778ab3e24 James Bottomley 2006-08-29  168  		}
32698c95529595 Damien Le Moal  2022-02-28  169  	}
980fa2f9d64b9b Darrick J. Wong 2007-01-11  170  	spin_unlock_irqrestore(&sa=
s_ha->phy_port_lock, flags);
2908d778ab3e24 James Bottomley 2006-08-29  171  =

2908d778ab3e24 James Bottomley 2006-08-29 @172  	if (!port->port) {
b4698d88585e23 Dan Williams    2012-04-19  173  		port->port =3D sas_port_a=
lloc(phy->phy->dev.parent, port->id);
2908d778ab3e24 James Bottomley 2006-08-29  174  		BUG_ON(!port->port);
2908d778ab3e24 James Bottomley 2006-08-29  175  		sas_port_add(port->port);
2908d778ab3e24 James Bottomley 2006-08-29  176  	}
2908d778ab3e24 James Bottomley 2006-08-29  177  	sas_port_add_phy(port->por=
t, phy->phy);
2908d778ab3e24 James Bottomley 2006-08-29  178  =

b3e3d4c618c5b9 John Garry      2019-12-19  179  	pr_debug("%s added to %s, =
phy_mask:0x%x (%016llx)\n",
71610f55fa4db6 Kay Sievers     2008-12-03  180  		 dev_name(&phy->phy->dev)=
, dev_name(&port->port->dev),
a29c05153630b2 James Bottomley 2008-02-23  181  		 port->phy_mask,
a29c05153630b2 James Bottomley 2008-02-23  182  		 SAS_ADDR(port->attached_=
sas_addr));
a29c05153630b2 James Bottomley 2008-02-23  183  =

085f104a83d565 John Garry      2019-04-12  184  	if (port_dev)
085f104a83d565 John Garry      2019-04-12  185  		port_dev->pathways =3D po=
rt->num_phys;
2908d778ab3e24 James Bottomley 2006-08-29  186  =

2908d778ab3e24 James Bottomley 2006-08-29  187  	/* Tell the LLDD about thi=
s port formation. */
2908d778ab3e24 James Bottomley 2006-08-29  188  	if (si->dft->lldd_port_for=
med)
2908d778ab3e24 James Bottomley 2006-08-29  189  		si->dft->lldd_port_formed=
(phy);
2908d778ab3e24 James Bottomley 2006-08-29  190  =

2908d778ab3e24 James Bottomley 2006-08-29  191  	sas_discover_event(phy->po=
rt, DISCE_DISCOVER_DOMAIN);
085f104a83d565 John Garry      2019-04-12  192  	/* Only insert a revalidat=
e event after initial discovery */
924a3541eab0d2 John Garry      2019-06-10  193  	if (port_dev && dev_is_exp=
ander(port_dev->dev_type)) {
085f104a83d565 John Garry      2019-04-12  194  		struct expander_device *e=
x_dev =3D &port_dev->ex_dev;
085f104a83d565 John Garry      2019-04-12  195  =

085f104a83d565 John Garry      2019-04-12  196  		ex_dev->ex_change_count =
=3D -1;
085f104a83d565 John Garry      2019-04-12  197  		sas_discover_event(port, =
DISCE_REVALIDATE_DOMAIN);
085f104a83d565 John Garry      2019-04-12  198  	}
517e5153d242cb Jason Yan       2017-12-08  199  	flush_workqueue(sas_ha->di=
sco_q);
2908d778ab3e24 James Bottomley 2006-08-29  200  }
2908d778ab3e24 James Bottomley 2006-08-29  201  =


:::::: The code at line 172 was first introduced by commit
:::::: 2908d778ab3e244900c310974e1fc1c69066e450 [SCSI] aic94xx: new driver

:::::: TO: James Bottomley <James.Bottomley@SteelEye.com>
:::::: CC: James Bottomley <jejb@mulgrave.il.steeleye.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5957196127797388606==--


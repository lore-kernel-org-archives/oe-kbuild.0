Content-Type: multipart/mixed; boundary="===============1506537378386352853=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] ata: libata-sff: refactor ata_sff_altstatus()
Date: Mon, 14 Feb 2022 17:59:05 +0800
Message-ID: <202202141714.X7UdMJUj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1506537378386352853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220213151032.4694-3-s.shtylyov@omp.ru>
References: <20220213151032.4694-3-s.shtylyov@omp.ru>
TO: Sergey Shtylyov <s.shtylyov@omp.ru>
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
TO: linux-ide(a)vger.kernel.org

Hi Sergey,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc4 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sergey-Shtylyov/Refactor-t=
he-accessors-for-the-ATA-device-control-and-alternate-status-registers/2022=
0213-231119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
b81b1829e7e39f6cebdf6e4d5484eacbceda8554
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: riscv-randconfig-m031-20220213 (https://download.01.org/0day-ci/arc=
hive/20220214/202202141714.X7UdMJUj-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/ata/libata-sff.c:1652 ata_sff_lost_interrupt() error: uninitialized=
 symbol 'status'.

vim +/status +1652 drivers/ata/libata-sff.c

624d5c514eed18 Tejun Heo       2008-03-25  1621  =

c96f1732e25362 Alan Cox        2009-03-24  1622  /**
c96f1732e25362 Alan Cox        2009-03-24  1623   *	ata_sff_lost_interrupt	=
-	Check for an apparent lost interrupt
c96f1732e25362 Alan Cox        2009-03-24  1624   *	@ap: port that appears =
to have timed out
c96f1732e25362 Alan Cox        2009-03-24  1625   *
c96f1732e25362 Alan Cox        2009-03-24  1626   *	Called from the libata =
error handlers when the core code suspects
c96f1732e25362 Alan Cox        2009-03-24  1627   *	an interrupt has been l=
ost. If it has complete anything we can and
c96f1732e25362 Alan Cox        2009-03-24  1628   *	then return. Interface =
must support altstatus for this faster
c96f1732e25362 Alan Cox        2009-03-24  1629   *	recovery to occur.
c96f1732e25362 Alan Cox        2009-03-24  1630   *
c96f1732e25362 Alan Cox        2009-03-24  1631   *	Locking:
c96f1732e25362 Alan Cox        2009-03-24  1632   *	Caller holds host lock
c96f1732e25362 Alan Cox        2009-03-24  1633   */
c96f1732e25362 Alan Cox        2009-03-24  1634  =

c96f1732e25362 Alan Cox        2009-03-24  1635  void ata_sff_lost_interrup=
t(struct ata_port *ap)
c96f1732e25362 Alan Cox        2009-03-24  1636  {
c96f1732e25362 Alan Cox        2009-03-24  1637  	u8 status;
c96f1732e25362 Alan Cox        2009-03-24  1638  	struct ata_queued_cmd *qc;
c96f1732e25362 Alan Cox        2009-03-24  1639  =

c96f1732e25362 Alan Cox        2009-03-24  1640  	/* Only one outstanding c=
ommand per SFF channel */
c96f1732e25362 Alan Cox        2009-03-24  1641  	qc =3D ata_qc_from_tag(ap=
, ap->link.active_tag);
3e4ec3443f70fb Tejun Heo       2010-05-10  1642  	/* We cannot lose an inte=
rrupt on a non-existent or polled command */
3e4ec3443f70fb Tejun Heo       2010-05-10  1643  	if (!qc || qc->tf.flags &=
 ATA_TFLAG_POLLING)
c96f1732e25362 Alan Cox        2009-03-24  1644  		return;
c96f1732e25362 Alan Cox        2009-03-24  1645  	/* See if the controller =
thinks it is still busy - if so the command
c96f1732e25362 Alan Cox        2009-03-24  1646  	   isn't a lost IRQ but i=
s still in progress */
57232468aca7de Sergey Shtylyov 2022-02-13  1647  	if (ata_sff_altstatus(ap,=
 &status) && (status & ATA_BUSY))
c96f1732e25362 Alan Cox        2009-03-24  1648  		return;
c96f1732e25362 Alan Cox        2009-03-24  1649  =

c96f1732e25362 Alan Cox        2009-03-24  1650  	/* There was a command ru=
nning, we are no longer busy and we have
c96f1732e25362 Alan Cox        2009-03-24  1651  	   no interrupt. */
a9a79dfec23956 Joe Perches     2011-04-15 @1652  	ata_port_warn(ap, "lost i=
nterrupt (Status 0x%x)\n",
c96f1732e25362 Alan Cox        2009-03-24  1653  								status);
c96f1732e25362 Alan Cox        2009-03-24  1654  	/* Run the host interrupt=
 logic as if the interrupt had not been
c96f1732e25362 Alan Cox        2009-03-24  1655  	   lost */
c3b2889424c26f Tejun Heo       2010-05-19  1656  	ata_sff_port_intr(ap, qc);
c96f1732e25362 Alan Cox        2009-03-24  1657  }
c96f1732e25362 Alan Cox        2009-03-24  1658  EXPORT_SYMBOL_GPL(ata_sff_=
lost_interrupt);
c96f1732e25362 Alan Cox        2009-03-24  1659  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1506537378386352853==--


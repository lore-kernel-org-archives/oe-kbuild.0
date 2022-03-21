Content-Type: multipart/mixed; boundary="===============5222652168691721366=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6432/13988] drivers/ata/libata-sff.c:1649 ata_sff_lost_interrupt() error: uninitialized symbol 'status'.
Date: Tue, 22 Mar 2022 01:07:45 +0800
Message-ID: <202203220153.uZ0MV8Ov-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5222652168691721366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sergey Shtylyov <s.shtylyov@omp.ru>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f9006d9269eac8ff295c2cb67280c54888c74106
commit: 03c0e84f9c1e166d57d06b04497e11205f48e9a8 [6432/13988] ata: libata-s=
ff: refactor ata_sff_altstatus()
:::::: branch date: 4 hours ago
:::::: commit date: 4 weeks ago
config: powerpc-randconfig-m031-20220321 (https://download.01.org/0day-ci/a=
rchive/20220322/202203220153.uZ0MV8Ov-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/ata/libata-sff.c:1649 ata_sff_lost_interrupt() error: uninitialized=
 symbol 'status'.

vim +/status +1649 drivers/ata/libata-sff.c

624d5c514eed18d Tejun Heo       2008-03-25  1621  =

c96f1732e25362d Alan Cox        2009-03-24  1622  /**
c96f1732e25362d Alan Cox        2009-03-24  1623   *	ata_sff_lost_interrupt=
	-	Check for an apparent lost interrupt
c96f1732e25362d Alan Cox        2009-03-24  1624   *	@ap: port that appears=
 to have timed out
c96f1732e25362d Alan Cox        2009-03-24  1625   *
c96f1732e25362d Alan Cox        2009-03-24  1626   *	Called from the libata=
 error handlers when the core code suspects
c96f1732e25362d Alan Cox        2009-03-24  1627   *	an interrupt has been =
lost. If it has complete anything we can and
c96f1732e25362d Alan Cox        2009-03-24  1628   *	then return. Interface=
 must support altstatus for this faster
c96f1732e25362d Alan Cox        2009-03-24  1629   *	recovery to occur.
c96f1732e25362d Alan Cox        2009-03-24  1630   *
c96f1732e25362d Alan Cox        2009-03-24  1631   *	Locking:
c96f1732e25362d Alan Cox        2009-03-24  1632   *	Caller holds host lock
c96f1732e25362d Alan Cox        2009-03-24  1633   */
c96f1732e25362d Alan Cox        2009-03-24  1634  =

c96f1732e25362d Alan Cox        2009-03-24  1635  void ata_sff_lost_interru=
pt(struct ata_port *ap)
c96f1732e25362d Alan Cox        2009-03-24  1636  {
c96f1732e25362d Alan Cox        2009-03-24  1637  	u8 status;
c96f1732e25362d Alan Cox        2009-03-24  1638  	struct ata_queued_cmd *q=
c;
c96f1732e25362d Alan Cox        2009-03-24  1639  =

c96f1732e25362d Alan Cox        2009-03-24  1640  	/* Only one outstanding =
command per SFF channel */
c96f1732e25362d Alan Cox        2009-03-24  1641  	qc =3D ata_qc_from_tag(a=
p, ap->link.active_tag);
3e4ec3443f70fbe Tejun Heo       2010-05-10  1642  	/* We cannot lose an int=
errupt on a non-existent or polled command */
3e4ec3443f70fbe Tejun Heo       2010-05-10  1643  	if (!qc || qc->tf.flags =
& ATA_TFLAG_POLLING)
c96f1732e25362d Alan Cox        2009-03-24  1644  		return;
c96f1732e25362d Alan Cox        2009-03-24  1645  	/* See if the controller=
 thinks it is still busy - if so the command
c96f1732e25362d Alan Cox        2009-03-24  1646  	   isn't a lost IRQ but =
is still in progress */
03c0e84f9c1e166 Sergey Shtylyov 2022-02-13  1647  	if (WARN_ON_ONCE(!ata_sf=
f_altstatus(ap, &status)))
03c0e84f9c1e166 Sergey Shtylyov 2022-02-13  1648  		return;
c96f1732e25362d Alan Cox        2009-03-24 @1649  	if (status & ATA_BUSY)
c96f1732e25362d Alan Cox        2009-03-24  1650  		return;
c96f1732e25362d Alan Cox        2009-03-24  1651  =

c96f1732e25362d Alan Cox        2009-03-24  1652  	/* There was a command r=
unning, we are no longer busy and we have
c96f1732e25362d Alan Cox        2009-03-24  1653  	   no interrupt. */
03c0e84f9c1e166 Sergey Shtylyov 2022-02-13  1654  	ata_port_warn(ap, "lost =
interrupt (Status 0x%x)\n", status);
c96f1732e25362d Alan Cox        2009-03-24  1655  	/* Run the host interrup=
t logic as if the interrupt had not been
c96f1732e25362d Alan Cox        2009-03-24  1656  	   lost */
c3b2889424c26f3 Tejun Heo       2010-05-19  1657  	ata_sff_port_intr(ap, qc=
);
c96f1732e25362d Alan Cox        2009-03-24  1658  }
c96f1732e25362d Alan Cox        2009-03-24  1659  EXPORT_SYMBOL_GPL(ata_sff=
_lost_interrupt);
c96f1732e25362d Alan Cox        2009-03-24  1660  =


:::::: The code at line 1649 was first introduced by commit
:::::: c96f1732e25362d10ee7bcac1df8412a2e6b7d23 [libata] Improve timeout ha=
ndling

:::::: TO: Alan Cox <alan@redhat.com>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5222652168691721366==--


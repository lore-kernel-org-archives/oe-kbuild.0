Content-Type: multipart/mixed; boundary="===============9087458315474808745=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sound:for-next 5/16] sound/core/rawmidi.c:1686:23: warning: Either the condition 'clock_type>=32' is redundant or the array 'clock_names[4]' is accessed at index 32, which is out of bounds. [arrayIndexOutOfBoundsCond]
Date: Tue, 18 May 2021 18:17:13 +0800
Message-ID: <202105181800.gIna6IWs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9087458315474808745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: alsa-devel(a)alsa-project.org
TO: David Henningsson <coding@diwic.se>
CC: Takashi Iwai <tiwai@suse.de>
CC: Jaroslav Kysela <perex@perex.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for=
-next
head:   e8bfa15fefcd863c757240b6df15ca60d9b97997
commit: 08fdced60ca08e34e316a3ab945636fcdfcbc973 [5/16] ALSA: rawmidi: Add =
framing mode
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/core/rawmidi.c:1686:23: warning: Either the condition 'clock_type>=
=3D32' is redundant or the array 'clock_names[4]' is accessed at index 32, =
which is out of bounds. [arrayIndexOutOfBoundsCond]
              clock_names[clock_type]);
                         ^
   sound/core/rawmidi.c:1682:33: note: Assuming that condition 'clock_type>=
=3D32' is not redundant
        if (!snd_BUG_ON(clock_type >=3D sizeof(clock_names)))
                                   ^
   sound/core/rawmidi.c:1686:23: note: Array index out of bounds
              clock_names[clock_type]);
                         ^

vim +1686 sound/core/rawmidi.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1612  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1613  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  1614   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1615  =

48c9d417d7269d Takashi Iwai      2005-11-17  1616  static void snd_rawmidi_=
proc_info_read(struct snd_info_entry *entry,
48c9d417d7269d Takashi Iwai      2005-11-17  1617  				       struct snd_in=
fo_buffer *buffer)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1618  {
48c9d417d7269d Takashi Iwai      2005-11-17  1619  	struct snd_rawmidi *rmi=
di;
48c9d417d7269d Takashi Iwai      2005-11-17  1620  	struct snd_rawmidi_subs=
tream *substream;
48c9d417d7269d Takashi Iwai      2005-11-17  1621  	struct snd_rawmidi_runt=
ime *runtime;
88a06d6fd6b369 Takashi Iwai      2020-12-06  1622  	unsigned long buffer_si=
ze, avail, xruns;
08fdced60ca08e David Henningsson 2021-05-15  1623  	unsigned int clock_type;
08fdced60ca08e David Henningsson 2021-05-15  1624  	static const char *cloc=
k_names[4] =3D { "none", "realtime", "monotonic", "monotonic raw" };
^1da177e4c3f41 Linus Torvalds    2005-04-16  1625  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1626  	rmidi =3D entry->privat=
e_data;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1627  	snd_iprintf(buffer, "%s=
\n\n", rmidi->name);
1a60d4c5a0c402 Ingo Molnar       2006-01-16  1628  	mutex_lock(&rmidi->open=
_mutex);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1629  	if (rmidi->info_flags &=
 SNDRV_RAWMIDI_INFO_OUTPUT) {
9244b2c3079faa Johannes Berg     2006-10-05  1630  		list_for_each_entry(su=
bstream,
9244b2c3079faa Johannes Berg     2006-10-05  1631  				    &rmidi->streams[=
SNDRV_RAWMIDI_STREAM_OUTPUT].substreams,
9244b2c3079faa Johannes Berg     2006-10-05  1632  				    list) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1633  			snd_iprintf(buffer,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1634  				    "Output %d\n"
^1da177e4c3f41 Linus Torvalds    2005-04-16  1635  				    "  Tx bytes     =
: %lu\n",
^1da177e4c3f41 Linus Torvalds    2005-04-16  1636  				    substream->numbe=
r,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1637  				    (unsigned long) =
substream->bytes);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1638  			if (substream->opened=
) {
7584af10cf46e0 Clemens Ladisch   2009-11-10  1639  				snd_iprintf(buffer,
7584af10cf46e0 Clemens Ladisch   2009-11-10  1640  				    "  Owner PID    =
: %d\n",
7584af10cf46e0 Clemens Ladisch   2009-11-10  1641  				    pid_vnr(substrea=
m->pid));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1642  				runtime =3D substrea=
m->runtime;
88a06d6fd6b369 Takashi Iwai      2020-12-06  1643  				spin_lock_irq(&runti=
me->lock);
88a06d6fd6b369 Takashi Iwai      2020-12-06  1644  				buffer_size =3D runt=
ime->buffer_size;
88a06d6fd6b369 Takashi Iwai      2020-12-06  1645  				avail =3D runtime->a=
vail;
88a06d6fd6b369 Takashi Iwai      2020-12-06  1646  				spin_unlock_irq(&run=
time->lock);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1647  				snd_iprintf(buffer,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1648  				    "  Mode         =
: %s\n"
^1da177e4c3f41 Linus Torvalds    2005-04-16  1649  				    "  Buffer size  =
: %lu\n"
^1da177e4c3f41 Linus Torvalds    2005-04-16  1650  				    "  Avail        =
: %lu\n",
^1da177e4c3f41 Linus Torvalds    2005-04-16  1651  				    runtime->oss ? "=
OSS compatible" : "native",
88a06d6fd6b369 Takashi Iwai      2020-12-06  1652  				    buffer_size, ava=
il);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1653  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1654  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1655  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1656  	if (rmidi->info_flags &=
 SNDRV_RAWMIDI_INFO_INPUT) {
9244b2c3079faa Johannes Berg     2006-10-05  1657  		list_for_each_entry(su=
bstream,
9244b2c3079faa Johannes Berg     2006-10-05  1658  				    &rmidi->streams[=
SNDRV_RAWMIDI_STREAM_INPUT].substreams,
9244b2c3079faa Johannes Berg     2006-10-05  1659  				    list) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1660  			snd_iprintf(buffer,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1661  				    "Input %d\n"
^1da177e4c3f41 Linus Torvalds    2005-04-16  1662  				    "  Rx bytes     =
: %lu\n",
^1da177e4c3f41 Linus Torvalds    2005-04-16  1663  				    substream->numbe=
r,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1664  				    (unsigned long) =
substream->bytes);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1665  			if (substream->opened=
) {
7584af10cf46e0 Clemens Ladisch   2009-11-10  1666  				snd_iprintf(buffer,
7584af10cf46e0 Clemens Ladisch   2009-11-10  1667  					    "  Owner PID   =
 : %d\n",
7584af10cf46e0 Clemens Ladisch   2009-11-10  1668  					    pid_vnr(substre=
am->pid));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1669  				runtime =3D substrea=
m->runtime;
88a06d6fd6b369 Takashi Iwai      2020-12-06  1670  				spin_lock_irq(&runti=
me->lock);
88a06d6fd6b369 Takashi Iwai      2020-12-06  1671  				buffer_size =3D runt=
ime->buffer_size;
88a06d6fd6b369 Takashi Iwai      2020-12-06  1672  				avail =3D runtime->a=
vail;
88a06d6fd6b369 Takashi Iwai      2020-12-06  1673  				xruns =3D runtime->x=
runs;
88a06d6fd6b369 Takashi Iwai      2020-12-06  1674  				spin_unlock_irq(&run=
time->lock);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1675  				snd_iprintf(buffer,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1676  					    "  Buffer size =
 : %lu\n"
^1da177e4c3f41 Linus Torvalds    2005-04-16  1677  					    "  Avail       =
 : %lu\n"
^1da177e4c3f41 Linus Torvalds    2005-04-16  1678  					    "  Overruns    =
 : %lu\n",
88a06d6fd6b369 Takashi Iwai      2020-12-06  1679  					    buffer_size, av=
ail, xruns);
08fdced60ca08e David Henningsson 2021-05-15  1680  				if (substream->frami=
ng =3D=3D SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP) {
08fdced60ca08e David Henningsson 2021-05-15  1681  					clock_type =3D subs=
tream->clock_type >> SNDRV_RAWMIDI_MODE_CLOCK_SHIFT;
08fdced60ca08e David Henningsson 2021-05-15  1682  					if (!snd_BUG_ON(clo=
ck_type >=3D sizeof(clock_names)))
08fdced60ca08e David Henningsson 2021-05-15  1683  						snd_iprintf(buffer,
08fdced60ca08e David Henningsson 2021-05-15  1684  							    "  Framing   =
   : tstamp\n"
08fdced60ca08e David Henningsson 2021-05-15  1685  							    "  Clock type=
   : %s\n",
08fdced60ca08e David Henningsson 2021-05-15 @1686  							    clock_names[c=
lock_type]);
08fdced60ca08e David Henningsson 2021-05-15  1687  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1688  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1689  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1690  	}
1a60d4c5a0c402 Ingo Molnar       2006-01-16  1691  	mutex_unlock(&rmidi->op=
en_mutex);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1692  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1693  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9087458315474808745==--


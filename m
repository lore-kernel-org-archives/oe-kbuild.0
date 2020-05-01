Content-Type: multipart/mixed; boundary="===============3937654270381470637=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] tty: n_gsm: Fix waking up upper tty layer when room available
Date: Fri, 01 May 2020 15:31:17 +0800
Message-ID: <202005011550.V7tpvSl3%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3937654270381470637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200430113433.2162886-5-gregory.clement@bootlin.com>
References: <20200430113433.2162886-5-gregory.clement@bootlin.com>
TO: Gregory CLEMENT <gregory.clement@bootlin.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jslaby@suse.com>
TO: linux-kernel(a)vger.kernel.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>

Hi Gregory,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on v5.7-rc3 next-20200430]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Gregory-CLEMENT/TTY-improv=
e-n_gsm-support/20200501-025835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/tty/n_gsm.c:711:22: warning: Local variable 'dlci' shadows outer=
 argument [shadowArgument]
       struct gsm_dlci *dlci;
                        ^
   drivers/tty/n_gsm.c:668:65: note: Shadowed declaration
   static void gsm_data_kick(struct gsm_mux *gsm, struct gsm_dlci *dlci)
                                                                   ^
   drivers/tty/n_gsm.c:711:22: note: Shadow variable
       struct gsm_dlci *dlci;
                        ^

# https://github.com/0day-ci/linux/commit/e8a71fbfa1dedd6b7a8f24787d207d389=
2d5b394
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout e8a71fbfa1dedd6b7a8f24787d207d3892d5b394
vim +/dlci +711 drivers/tty/n_gsm.c

e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  655  =

e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  656  /**
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  657   *	gsm=
_data_kick		-	poke the queue
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  658   *	@gs=
m: GSM Mux
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  659   *
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  660   *	The=
 tty device has called us to indicate that room has appeared in
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  661   *	the=
 transmit queue. Ram more data into the pipe if we have any
c01af4fec2c8f3 drivers/tty/n_gsm.c  Frederic Berat  2012-08-13  662   *	If =
we have been flow-stopped by a CMD_FCOFF, then we can only
c01af4fec2c8f3 drivers/tty/n_gsm.c  Frederic Berat  2012-08-13  663   *	sen=
d messages on DLCI0 until CMD_FCON
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  664   *
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  665   *	FIX=
ME: lock against link layer control transmissions
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  666   */
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  667  =

e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  668  static=
 void gsm_data_kick(struct gsm_mux *gsm, struct gsm_dlci *dlci)
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  669  {
b4338e1efc3399 drivers/tty/n_gsm.c  Russ Gorby      2012-08-13  670  	struc=
t gsm_msg *msg, *nmsg;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  671  	int l=
en;
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  672  	struc=
t tty_struct *tty_dlci =3D NULL;
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  673  =

e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  674  =

b4338e1efc3399 drivers/tty/n_gsm.c  Russ Gorby      2012-08-13  675  	list_=
for_each_entry_safe(msg, nmsg, &gsm->tx_list, list) {
b4338e1efc3399 drivers/tty/n_gsm.c  Russ Gorby      2012-08-13  676  		if (=
gsm->constipated && msg->addr)
c01af4fec2c8f3 drivers/tty/n_gsm.c  Frederic Berat  2012-08-13  677  			con=
tinue;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  678  		if (=
gsm->encoding !=3D 0) {
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  679  			gsm=
->txframe[0] =3D GSM1_SOF;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  680  			len=
 =3D gsm_stuff_frame(msg->data,
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  681  						=
gsm->txframe + 1, msg->len);
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  682  			gsm=
->txframe[len + 1] =3D GSM1_SOF;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  683  			len=
 +=3D 2;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  684  		} el=
se {
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  685  			gsm=
->txframe[0] =3D GSM0_SOF;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  686  			mem=
cpy(gsm->txframe + 1 , msg->data, msg->len);
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  687  			gsm=
->txframe[msg->len + 1] =3D GSM0_SOF;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  688  			len=
 =3D msg->len + 2;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  689  		}
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  690  =

0a77c4f9d451a6 drivers/tty/n_gsm.c  Joe Perches     2011-04-25  691  		if (=
debug & 4)
0a77c4f9d451a6 drivers/tty/n_gsm.c  Joe Perches     2011-04-25  692  			pri=
nt_hex_dump_bytes("gsm_data_kick: ",
0a77c4f9d451a6 drivers/tty/n_gsm.c  Joe Perches     2011-04-25  693  					 =
    DUMP_PREFIX_OFFSET,
0a77c4f9d451a6 drivers/tty/n_gsm.c  Joe Perches     2011-04-25  694  					 =
    gsm->txframe, len);
6ffac3413ab519 drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  695  		if (=
gsm->output(gsm, gsm->txframe, len) < 0)
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  696  			bre=
ak;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  697  		/* F=
IXME: Can eliminate one SOF in many more cases */
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  698  		gsm-=
>tx_bytes -=3D msg->len;
c01af4fec2c8f3 drivers/tty/n_gsm.c  Frederic Berat  2012-08-13  699  =

b4338e1efc3399 drivers/tty/n_gsm.c  Russ Gorby      2012-08-13  700  		list=
_del(&msg->list);
b4338e1efc3399 drivers/tty/n_gsm.c  Russ Gorby      2012-08-13  701  		kfre=
e(msg);
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  702  =

e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  703  		if (=
dlci) {
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  704  			tty=
_dlci =3D tty_port_tty_get(&dlci->port);
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  705  			if =
(tty_dlci)
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  706  				tt=
y_wakeup(tty_dlci);
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  707  		} el=
se {
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  708  			int=
 i =3D 0;
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  709  =

e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  710  			whi=
le (i < NUM_DLCI) {
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30 @711  				st=
ruct gsm_dlci *dlci;
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  712  =

e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  713  				dl=
ci =3D gsm->dlci[i];
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  714  				if=
 (dlci =3D=3D NULL) {
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  715  					i=
++;
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  716  					c=
ontinue;
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  717  				}
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  718  =

e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  719  				tt=
y_dlci =3D tty_port_tty_get(&dlci->port);
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  720  				if=
 (tty_dlci)
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  721  					t=
ty_wakeup(tty_dlci);
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  722  				i+=
+;
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  723  			}
e8a71fbfa1dedd drivers/tty/n_gsm.c  Gregory CLEMENT 2020-04-30  724  		}
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  725  	}
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  726  }
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox        2010-03-26  727  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3937654270381470637==--


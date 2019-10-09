Content-Type: multipart/mixed; boundary="===============6160305123250991816=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-stable-rc:linux-3.16.y 6719/6738] net/sched/sch_netem.c:581 netem_enqueue() error: we previously assumed 'skb' could be null (see line 505)
Date: Wed, 09 Oct 2019 11:12:00 +0300
Message-ID: <20191009081200.GR21515@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6160305123250991816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-3.16.y
head:   c508a924ddd1119a8037c1ec23f560eade0444c6
commit: 61763432af929bd3d091a18469c130719f00c6de [6719/6738] net: netem: fi=
x backlog accounting for corrupted GSO frames

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/sched/sch_netem.c:581 netem_enqueue() error: we previously assumed 'skb=
' could be null (see line 505)
net/sched/sch_netem.c:581 netem_enqueue() error: dereferencing freed memory=
 'skb'

# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.gi=
t/commit/?id=3D61763432af929bd3d091a18469c130719f00c6de
git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/=
git/stable/linux-stable-rc.git
git remote update linux-stable-rc
git checkout 61763432af929bd3d091a18469c130719f00c6de
vim +/skb +581 net/sched/sch_netem.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  436  static int netem_enqueu=
e(struct sk_buff *skb, struct Qdisc *sch)
^1da177e4c3f41 Linus Torvalds      2005-04-16  437  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  438  	struct netem_sched_dat=
a *q =3D qdisc_priv(sch);
89e1df74f841fc Guillaume Chazarain 2006-07-21  439  	/* We don't fill cb no=
w as skb_unshare() may invalidate it */
89e1df74f841fc Guillaume Chazarain 2006-07-21  440  	struct netem_skb_cb *c=
b;
0afb51e7285597 Stephen Hemminger   2005-05-26  441  	struct sk_buff *skb2;
ff962567db4cf1 Neil Horman         2016-05-02  442  	struct sk_buff *segs =
=3D NULL;
61763432af929b Jakub Kicinski      2019-06-17  443  	unsigned int prev_len =
=3D qdisc_pkt_len(skb);
0afb51e7285597 Stephen Hemminger   2005-05-26  444  	int count =3D 1;
ff962567db4cf1 Neil Horman         2016-05-02  445  	int rc =3D NET_XMIT_SU=
CCESS;
a550a01b8af856 Sheng Lan           2019-02-28  446  	int rc_drop =3D NET_XM=
IT_DROP;
^1da177e4c3f41 Linus Torvalds      2005-04-16  447  =

0afb51e7285597 Stephen Hemminger   2005-05-26  448  	/* Random duplication =
*/
0afb51e7285597 Stephen Hemminger   2005-05-26  449  	if (q->duplicate && q-=
>duplicate >=3D get_crandom(&q->dup_cor))
0afb51e7285597 Stephen Hemminger   2005-05-26  450  		++count;
0afb51e7285597 Stephen Hemminger   2005-05-26  451  =

661b79725fea03 stephen hemminger   2011-02-23  452  	/* Drop packet? */
e4ae004b84b315 Eric Dumazet        2012-04-30  453  	if (loss_event(q)) {
e4ae004b84b315 Eric Dumazet        2012-04-30  454  		if (q->ecn && INET_EC=
N_set_ce(skb))
e4ae004b84b315 Eric Dumazet        2012-04-30  455  			sch->qstats.drops++;=
 /* mark packet */
e4ae004b84b315 Eric Dumazet        2012-04-30  456  		else
0afb51e7285597 Stephen Hemminger   2005-05-26  457  			--count;
e4ae004b84b315 Eric Dumazet        2012-04-30  458  	}
0afb51e7285597 Stephen Hemminger   2005-05-26  459  	if (count =3D=3D 0) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  460  		sch->qstats.drops++;
^1da177e4c3f41 Linus Torvalds      2005-04-16  461  		kfree_skb(skb);
c27f339af90bb8 Jarek Poplawski     2008-08-04  462  		return NET_XMIT_SUCCE=
SS | __NET_XMIT_BYPASS;
^1da177e4c3f41 Linus Torvalds      2005-04-16  463  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  464  =

5a308f40bfe27f Eric Dumazet        2012-07-14  465  	/* If a delay is expec=
ted, orphan the skb. (orphaning usually takes
5a308f40bfe27f Eric Dumazet        2012-07-14  466  	 * place at TX complet=
ion time, so _before_ the link transit delay)
5a308f40bfe27f Eric Dumazet        2012-07-14  467  	 */
5a308f40bfe27f Eric Dumazet        2012-07-14  468  	if (q->latency || q->j=
itter)
f2f872f9272a79 Eric Dumazet        2013-07-30  469  		skb_orphan_partial(sk=
b);
4e8a5201506423 David S. Miller     2006-10-22  470  =

0afb51e7285597 Stephen Hemminger   2005-05-26  471  	/*
0afb51e7285597 Stephen Hemminger   2005-05-26  472  	 * If we need to dupli=
cate packet, then re-insert at top of the
0afb51e7285597 Stephen Hemminger   2005-05-26  473  	 * qdisc tree, since p=
arent queuer expects that only one
0afb51e7285597 Stephen Hemminger   2005-05-26  474  	 * skb will be queued.
d5d75cd6b10dda Stephen Hemminger   2005-05-03  475  	 */
0afb51e7285597 Stephen Hemminger   2005-05-26  476  	if (count > 1 && (skb2=
 =3D skb_clone(skb, GFP_ATOMIC)) !=3D NULL) {
7698b4fcabcd79 David S. Miller     2008-07-16  477  		struct Qdisc *rootq =
=3D qdisc_root(sch);
0afb51e7285597 Stephen Hemminger   2005-05-26  478  		u32 dupsave =3D q->du=
plicate; /* prevent duplicating a dup... */
0afb51e7285597 Stephen Hemminger   2005-05-26  479  		q->duplicate =3D 0;
0afb51e7285597 Stephen Hemminger   2005-05-26  480  =

5f86173bdf1598 Jussi Kivilinna     2008-07-20  481  		qdisc_enqueue_root(sk=
b2, rootq);
0afb51e7285597 Stephen Hemminger   2005-05-26  482  		q->duplicate =3D dups=
ave;
a550a01b8af856 Sheng Lan           2019-02-28  483  		rc_drop =3D NET_XMIT_=
SUCCESS;
^1da177e4c3f41 Linus Torvalds      2005-04-16  484  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  485  =

c865e5d99e25a1 Stephen Hemminger   2005-12-21  486  	/*
c865e5d99e25a1 Stephen Hemminger   2005-12-21  487  	 * Randomized packet c=
orruption.
c865e5d99e25a1 Stephen Hemminger   2005-12-21  488  	 * Make copy if needed=
 since we are modifying
c865e5d99e25a1 Stephen Hemminger   2005-12-21  489  	 * If packet is going =
to be hardware checksummed, then
c865e5d99e25a1 Stephen Hemminger   2005-12-21  490  	 * do it now in softwa=
re before we mangle it.
c865e5d99e25a1 Stephen Hemminger   2005-12-21  491  	 */
c865e5d99e25a1 Stephen Hemminger   2005-12-21  492  	if (q->corrupt && q->c=
orrupt >=3D get_crandom(&q->corrupt_cor)) {
ff962567db4cf1 Neil Horman         2016-05-02  493  		if (skb_is_gso(skb)) {
ff962567db4cf1 Neil Horman         2016-05-02  494  			segs =3D netem_segme=
nt(skb, sch);
ff962567db4cf1 Neil Horman         2016-05-02  495  			if (!segs)
a550a01b8af856 Sheng Lan           2019-02-28  496  				return rc_drop;
61763432af929b Jakub Kicinski      2019-06-17  497  			qdisc_skb_cb(segs)->=
pkt_len =3D segs->len;
ff962567db4cf1 Neil Horman         2016-05-02  498  		} else {
ff962567db4cf1 Neil Horman         2016-05-02  499  			segs =3D skb;
ff962567db4cf1 Neil Horman         2016-05-02  500  		}
ff962567db4cf1 Neil Horman         2016-05-02  501  =

ff962567db4cf1 Neil Horman         2016-05-02  502  		skb =3D segs;
ff962567db4cf1 Neil Horman         2016-05-02  503  		segs =3D segs->next;
                                                                ^^^^^^^^^^^=
^^^^^^^

ff962567db4cf1 Neil Horman         2016-05-02  504  =

f64f9e719261a8 Joe Perches         2009-11-29 @505  		if (!(skb =3D skb_uns=
hare(skb, GFP_ATOMIC)) ||
                                                                    ^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
skb can be NULL.  But possible that means "segs" is NULL also?  I don't
know.  Smatch is supposed to be able to figure this stuff out, but some
things are too complicated.

f64f9e719261a8 Joe Perches         2009-11-29  506  		    (skb->ip_summed =
=3D=3D CHECKSUM_PARTIAL &&
ff962567db4cf1 Neil Horman         2016-05-02  507  		     skb_checksum_hel=
p(skb))) {
ff962567db4cf1 Neil Horman         2016-05-02  508  			rc =3D qdisc_drop(sk=
b, sch);
ff962567db4cf1 Neil Horman         2016-05-02  509  			goto finish_segs;
                                                                        ^^^=
^^^^^^^^^^^^^^

ff962567db4cf1 Neil Horman         2016-05-02  510  		}
c865e5d99e25a1 Stephen Hemminger   2005-12-21  511  =

63862b5bef7349 Aruna-Hewapathirane 2014-01-11  512  		skb->data[prandom_u32=
() % skb_headlen(skb)] ^=3D
63862b5bef7349 Aruna-Hewapathirane 2014-01-11  513  			1<<(prandom_u32() % =
8);
c865e5d99e25a1 Stephen Hemminger   2005-12-21  514  	}
c865e5d99e25a1 Stephen Hemminger   2005-12-21  515  =

10b6b9147da2c1 Alexey Kodanev      2018-03-05  516  	if (unlikely(skb_queue=
_len(&sch->q) >=3D sch->limit)) {
10b6b9147da2c1 Alexey Kodanev      2018-03-05  517  		/* qdisc_reshape_fail=
() can't handle segmented skb */
10b6b9147da2c1 Alexey Kodanev      2018-03-05  518  		if (segs)
a550a01b8af856 Sheng Lan           2019-02-28  519  			qdisc_drop_all(skb, =
sch);
a550a01b8af856 Sheng Lan           2019-02-28  520  		else if (qdisc_reshap=
e_fail(skb, sch) =3D=3D NET_XMIT_SUCCESS)
a550a01b8af856 Sheng Lan           2019-02-28  521  			return NET_XMIT_SUCC=
ESS;
a550a01b8af856 Sheng Lan           2019-02-28  522  		return rc_drop;
10b6b9147da2c1 Alexey Kodanev      2018-03-05  523  	}
960fb66e520a40 Eric Dumazet        2012-07-03  524  =

960fb66e520a40 Eric Dumazet        2012-07-03  525  	sch->qstats.backlog +=
=3D qdisc_pkt_len(skb);
960fb66e520a40 Eric Dumazet        2012-07-03  526  =

5f86173bdf1598 Jussi Kivilinna     2008-07-20  527  	cb =3D netem_skb_cb(sk=
b);
f64f9e719261a8 Joe Perches         2009-11-29  528  	if (q->gap =3D=3D 0 ||=
		/* not doing reordering */
a42b4799c68372 Vijay Subramanian   2012-01-19  529  	    q->counter < q->ga=
p - 1 ||	/* inside last reordering gap */
f64f9e719261a8 Joe Perches         2009-11-29  530  	    q->reorder < get_c=
random(&q->reorder_cor)) {
0f9f32ac65ee4a Stephen Hemminger   2005-05-26  531  		psched_time_t now;
07aaa11540828f Stephen Hemminger   2005-11-03  532  		psched_tdiff_t delay;
07aaa11540828f Stephen Hemminger   2005-11-03  533  =

07aaa11540828f Stephen Hemminger   2005-11-03  534  		delay =3D tabledist(q=
->latency, q->jitter,
07aaa11540828f Stephen Hemminger   2005-11-03  535  				  &q->delay_cor, q-=
>delay_dist);
07aaa11540828f Stephen Hemminger   2005-11-03  536  =

3bebcda2807737 Patrick McHardy     2007-03-23  537  		now =3D psched_get_ti=
me();
7bc0f28c7a0cd1 Hagen Paul Pfeifer  2011-11-30  538  =

7bc0f28c7a0cd1 Hagen Paul Pfeifer  2011-11-30  539  		if (q->rate) {
aec0a40a6f7884 Eric Dumazet        2013-06-28  540  			struct sk_buff *last;
7bc0f28c7a0cd1 Hagen Paul Pfeifer  2011-11-30  541  =

aec0a40a6f7884 Eric Dumazet        2013-06-28  542  			if (!skb_queue_empty=
(&sch->q))
aec0a40a6f7884 Eric Dumazet        2013-06-28  543  				last =3D skb_peek_t=
ail(&sch->q);
aec0a40a6f7884 Eric Dumazet        2013-06-28  544  			else
aec0a40a6f7884 Eric Dumazet        2013-06-28  545  				last =3D netem_rb_t=
o_skb(rb_last(&q->t_root));
aec0a40a6f7884 Eric Dumazet        2013-06-28  546  			if (last) {
7bc0f28c7a0cd1 Hagen Paul Pfeifer  2011-11-30  547  				/*
a13d3104710184 Johannes Naab       2013-01-23  548  				 * Last packet in q=
ueue is reference point (now),
a13d3104710184 Johannes Naab       2013-01-23  549  				 * calculate this t=
ime bonus and subtract
7bc0f28c7a0cd1 Hagen Paul Pfeifer  2011-11-30  550  				 * from delay.
7bc0f28c7a0cd1 Hagen Paul Pfeifer  2011-11-30  551  				 */
aec0a40a6f7884 Eric Dumazet        2013-06-28  552  				delay -=3D netem_sk=
b_cb(last)->time_to_send - now;
a13d3104710184 Johannes Naab       2013-01-23  553  				delay =3D max_t(psc=
hed_tdiff_t, 0, delay);
aec0a40a6f7884 Eric Dumazet        2013-06-28  554  				now =3D netem_skb_c=
b(last)->time_to_send;
7bc0f28c7a0cd1 Hagen Paul Pfeifer  2011-11-30  555  			}
a13d3104710184 Johannes Naab       2013-01-23  556  =

8cfd88d6d70735 Yang Yingliang      2013-12-25  557  			delay +=3D packet_le=
n_2_sched_time(qdisc_pkt_len(skb), q);
7bc0f28c7a0cd1 Hagen Paul Pfeifer  2011-11-30  558  		}
7bc0f28c7a0cd1 Hagen Paul Pfeifer  2011-11-30  559  =

7c59e25f3186f2 Patrick McHardy     2007-03-23  560  		cb->time_to_send =3D =
now + delay;
aec0a40a6f7884 Eric Dumazet        2013-06-28  561  		cb->tstamp_save =3D s=
kb->tstamp;
^1da177e4c3f41 Linus Torvalds      2005-04-16  562  		++q->counter;
960fb66e520a40 Eric Dumazet        2012-07-03  563  		tfifo_enqueue(skb, sc=
h);
^1da177e4c3f41 Linus Torvalds      2005-04-16  564  	} else {
0dca51d362b8e4 Stephen Hemminger   2005-05-26  565  		/*
0dca51d362b8e4 Stephen Hemminger   2005-05-26  566  		 * Do re-ordering by =
putting one out of N packets at the front
0dca51d362b8e4 Stephen Hemminger   2005-05-26  567  		 * of the queue.
0dca51d362b8e4 Stephen Hemminger   2005-05-26  568  		 */
3bebcda2807737 Patrick McHardy     2007-03-23  569  		cb->time_to_send =3D =
psched_get_time();
0dca51d362b8e4 Stephen Hemminger   2005-05-26  570  		q->counter =3D 0;
8ba25dad0ac788 Jarek Poplawski     2008-11-02  571  =

50612537e9ab29 Eric Dumazet        2011-12-28  572  		__skb_queue_head(&sch=
->q, skb);
eb10192447370f Hagen Paul Pfeifer  2012-01-04  573  		sch->qstats.requeues+=
+;
378a2f090f7a47 Jarek Poplawski     2008-08-04  574  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  575  =

ff962567db4cf1 Neil Horman         2016-05-02  576  finish_segs:
ff962567db4cf1 Neil Horman         2016-05-02  577  	if (segs) {
                                                            ^^^^
61763432af929b Jakub Kicinski      2019-06-17  578  		unsigned int len, las=
t_len;
61763432af929b Jakub Kicinski      2019-06-17  579  		int nb =3D 0;
61763432af929b Jakub Kicinski      2019-06-17  580  =

61763432af929b Jakub Kicinski      2019-06-17 @581  		len =3D skb->len;
                                                                      ^^^^^=
^^^
Dereference.

61763432af929b Jakub Kicinski      2019-06-17  582  =

ff962567db4cf1 Neil Horman         2016-05-02  583  		while (segs) {
ff962567db4cf1 Neil Horman         2016-05-02  584  			skb2 =3D segs->next;
ff962567db4cf1 Neil Horman         2016-05-02  585  			segs->next =3D NULL;
ff962567db4cf1 Neil Horman         2016-05-02  586  			qdisc_skb_cb(segs)->=
pkt_len =3D segs->len;
ff962567db4cf1 Neil Horman         2016-05-02  587  			last_len =3D segs->l=
en;
ff962567db4cf1 Neil Horman         2016-05-02  588  			rc =3D qdisc_enqueue=
(segs, sch);
ff962567db4cf1 Neil Horman         2016-05-02  589  			if (rc !=3D NET_XMIT=
_SUCCESS) {
ff962567db4cf1 Neil Horman         2016-05-02  590  				if (net_xmit_drop_c=
ount(rc))
ff962567db4cf1 Neil Horman         2016-05-02  591  					sch->qstats.drops+=
+;
ff962567db4cf1 Neil Horman         2016-05-02  592  			} else {
ff962567db4cf1 Neil Horman         2016-05-02  593  				nb++;
ff962567db4cf1 Neil Horman         2016-05-02  594  				len +=3D last_len;
ff962567db4cf1 Neil Horman         2016-05-02  595  			}
ff962567db4cf1 Neil Horman         2016-05-02  596  			segs =3D skb2;
ff962567db4cf1 Neil Horman         2016-05-02  597  		}
61763432af929b Jakub Kicinski      2019-06-17  598  		qdisc_tree_reduce_bac=
klog(sch, -nb, prev_len - len);
ff962567db4cf1 Neil Horman         2016-05-02  599  	}
10f6dfcfde8844 stephen hemminger   2011-02-23  600  	return NET_XMIT_SUCCES=
S;
^1da177e4c3f41 Linus Torvalds      2005-04-16  601  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============6160305123250991816==--


Content-Type: multipart/mixed; boundary="===============1950532240236463408=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/nvme/target/fc.c:1024:65: warning: Parameter 'hosthandle' can be declared with const [constParameter]
Date: Mon, 04 Apr 2022 02:53:54 +0800
Message-ID: <202204040200.dIoBq1ZH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1950532240236463408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Amit Engel <amit.engel@dell.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>
CC: James Smart <jsmart2021@gmail.com>
CC: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: 0d8ddeea11d00010c8b0ecbe9d3b90811cd19867 nvmet-fc: simplify nvmet_f=
c_alloc_hostport
date:   12 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 12 months ago
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/nvme/target/fcloop.c:1189:15: warning: Uninitialized variable: t=
lport->localport [uninitvar]
     if (tlport->localport->node_name =3D=3D nodename &&
                 ^
   drivers/nvme/target/fcloop.c:1183:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/nvme/target/fcloop.c:1189:15: note: Uninitialized variable: tlpo=
rt->localport
     if (tlport->localport->node_name =3D=3D nodename &&
                 ^
>> drivers/nvme/target/fcloop.c:1384:16: warning: Uninitialized variable: t=
mpport->node_name [uninitvar]
     if (tmpport->node_name =3D=3D nodename &&
                  ^
   drivers/nvme/target/fcloop.c:1378:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/nvme/target/fcloop.c:1384:16: note: Uninitialized variable: tmpp=
ort->node_name
     if (tmpport->node_name =3D=3D nodename &&
                  ^
   drivers/nvme/target/fcloop.c:1482:16: warning: Uninitialized variable: t=
mpport->node_name [uninitvar]
     if (tmpport->node_name =3D=3D nodename &&
                  ^
   drivers/nvme/target/fcloop.c:1476:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/nvme/target/fcloop.c:1482:16: note: Uninitialized variable: tmpp=
ort->node_name
     if (tmpport->node_name =3D=3D nodename &&
                  ^
--
>> drivers/nvme/target/fc.c:1024:65: warning: Parameter 'hosthandle' can be=
 declared with const [constParameter]
   nvmet_fc_match_hostport(struct nvmet_fc_tgtport *tgtport, void *hosthand=
le)
                                                                   ^
   drivers/nvme/target/fc.c:1565:41: warning: Parameter 'ctrl' can be decla=
red with const [constParameter]
   nvmet_fc_delete_ctrl(struct nvmet_ctrl *ctrl)
                                           ^
>> drivers/nvme/target/fc.c:970:32: warning: Uninitialized variable: assoc-=
>association_id [uninitvar]
     if (association_id =3D=3D assoc->association_id) {
                                  ^
   drivers/nvme/target/fc.c:965:10: note: Assuming condition is false
    if (qid > NVMET_NR_QUEUES)
            ^
   drivers/nvme/target/fc.c:970:32: note: Uninitialized variable: assoc->as=
sociation_id
     if (association_id =3D=3D assoc->association_id) {
                                  ^
>> drivers/nvme/target/fc.c:1031:13: warning: Uninitialized variable: host-=
>hosthandle [uninitvar]
     if (host->hosthandle =3D=3D hosthandle && !host->invalid) {
               ^
   drivers/nvme/target/fc.c:1253:32: warning: Uninitialized variable: assoc=
->association_id [uninitvar]
     if (association_id =3D=3D assoc->association_id) {
                                  ^
>> drivers/nvme/target/fc.c:1332:48: warning: Uninitialized variable: pe->n=
ode_name [uninitvar]
     if (tgtport->fc_target_port.node_name =3D=3D pe->node_name &&
                                                  ^
>> drivers/nvme/target/fc.c:1492:27: warning: Uninitialized variables: asso=
c.association_id, assoc.a_id, assoc.terminating, assoc.tgtport, assoc.hostp=
ort, assoc.rcv_disconn, assoc.a_list, assoc.ref, assoc.del_work, assoc.rcu =
[uninitvar]
     if (!nvmet_fc_tgt_a_get(assoc))
                             ^
>> drivers/nvme/target/fc.c:1542:15: warning: Uninitialized variable: assoc=
->hostport [uninitvar]
     if (!assoc->hostport ||
                 ^
>> drivers/nvme/target/fc.c:1577:29: warning: Uninitialized variables: tgtp=
ort.fc_target_port, tgtport.tgt_list, tgtport.dev, tgtport.ops, tgtport.iod=
, tgtport.lock, tgtport.ls_rcv_list, tgtport.ls_req_list, tgtport.ls_busyli=
st, tgtport.assoc_list, tgtport.host_list, tgtport.assoc_cnt, tgtport.pe, t=
gtport.ref, tgtport.max_sg_cnt [uninitvar]
     if (!nvmet_fc_tgtport_get(tgtport))
                               ^
   drivers/nvme/target/fc.c:1585:28: warning: Uninitialized variables: asso=
c.association_id, assoc.a_id, assoc.terminating, assoc.tgtport, assoc.hostp=
ort, assoc.rcv_disconn, assoc.a_list, assoc.ref, assoc.del_work, assoc.rcu =
[uninitvar]
       if (nvmet_fc_tgt_a_get(assoc))
                              ^
   drivers/nvme/target/fc.c:1577:7: note: Assuming condition is false
     if (!nvmet_fc_tgtport_get(tgtport))
         ^
   drivers/nvme/target/fc.c:1577:7: note: Assuming condition is false
     if (!nvmet_fc_tgtport_get(tgtport))
         ^
   drivers/nvme/target/fc.c:1577:7: note: Assuming condition is false
     if (!nvmet_fc_tgtport_get(tgtport))
         ^
   drivers/nvme/target/fc.c:1577:7: note: Assuming condition is false
     if (!nvmet_fc_tgtport_get(tgtport))
         ^
   drivers/nvme/target/fc.c:1577:7: note: Assuming condition is false
     if (!nvmet_fc_tgtport_get(tgtport))
         ^
   drivers/nvme/target/fc.c:1577:7: note: Assuming condition is false
     if (!nvmet_fc_tgtport_get(tgtport))
         ^
   drivers/nvme/target/fc.c:1577:7: note: Assuming condition is false
     if (!nvmet_fc_tgtport_get(tgtport))
         ^
   drivers/nvme/target/fc.c:1577:7: note: Assuming condition is false
     if (!nvmet_fc_tgtport_get(tgtport))
         ^
   drivers/nvme/target/fc.c:1577:7: note: Assuming condition is false
     if (!nvmet_fc_tgtport_get(tgtport))
         ^
   drivers/nvme/target/fc.c:1577:7: note: Assuming condition is false
     if (!nvmet_fc_tgtport_get(tgtport))
         ^
   drivers/nvme/target/fc.c:1585:28: note: Uninitialized variables: assoc.a=
ssociation_id, assoc.a_id, assoc.terminating, assoc.tgtport, assoc.hostport=
, assoc.rcv_disconn, assoc.a_list, assoc.ref, assoc.del_work, assoc.rcu
       if (nvmet_fc_tgt_a_get(assoc))
                              ^

vim +/hosthandle +1024 drivers/nvme/target/fc.c

c53432030d8642 James Smart   2016-12-02   955  =

c53432030d8642 James Smart   2016-12-02   956  static struct nvmet_fc_tgt_q=
ueue *
c53432030d8642 James Smart   2016-12-02   957  nvmet_fc_find_target_queue(s=
truct nvmet_fc_tgtport *tgtport,
c53432030d8642 James Smart   2016-12-02   958  				u64 connection_id)
c53432030d8642 James Smart   2016-12-02   959  {
c53432030d8642 James Smart   2016-12-02   960  	struct nvmet_fc_tgt_assoc *=
assoc;
c53432030d8642 James Smart   2016-12-02   961  	struct nvmet_fc_tgt_queue *=
queue;
c53432030d8642 James Smart   2016-12-02   962  	u64 association_id =3D nvme=
t_fc_getassociationid(connection_id);
c53432030d8642 James Smart   2016-12-02   963  	u16 qid =3D nvmet_fc_getque=
ueid(connection_id);
c53432030d8642 James Smart   2016-12-02   964  =

0c319d3a144d4b James Smart   2017-09-19   965  	if (qid > NVMET_NR_QUEUES)
0c319d3a144d4b James Smart   2017-09-19   966  		return NULL;
0c319d3a144d4b James Smart   2017-09-19   967  =

4e2f02bf77dac7 Leonid Ravich 2021-01-03   968  	rcu_read_lock();
4e2f02bf77dac7 Leonid Ravich 2021-01-03   969  	list_for_each_entry_rcu(ass=
oc, &tgtport->assoc_list, a_list) {
c53432030d8642 James Smart   2016-12-02  @970  		if (association_id =3D=3D =
assoc->association_id) {
4e2f02bf77dac7 Leonid Ravich 2021-01-03   971  			queue =3D rcu_dereference=
(assoc->queues[qid]);
c53432030d8642 James Smart   2016-12-02   972  			if (queue &&
c53432030d8642 James Smart   2016-12-02   973  			    (!atomic_read(&queue-=
>connected) ||
c53432030d8642 James Smart   2016-12-02   974  			     !nvmet_fc_tgt_q_get(=
queue)))
c53432030d8642 James Smart   2016-12-02   975  				queue =3D NULL;
4e2f02bf77dac7 Leonid Ravich 2021-01-03   976  			rcu_read_unlock();
c53432030d8642 James Smart   2016-12-02   977  			return queue;
c53432030d8642 James Smart   2016-12-02   978  		}
c53432030d8642 James Smart   2016-12-02   979  	}
4e2f02bf77dac7 Leonid Ravich 2021-01-03   980  	rcu_read_unlock();
c53432030d8642 James Smart   2016-12-02   981  	return NULL;
c53432030d8642 James Smart   2016-12-02   982  }
c53432030d8642 James Smart   2016-12-02   983  =

58ab8ff9dca214 James Smart   2020-03-31   984  static void
58ab8ff9dca214 James Smart   2020-03-31   985  nvmet_fc_hostport_free(struc=
t kref *ref)
58ab8ff9dca214 James Smart   2020-03-31   986  {
58ab8ff9dca214 James Smart   2020-03-31   987  	struct nvmet_fc_hostport *h=
ostport =3D
58ab8ff9dca214 James Smart   2020-03-31   988  		container_of(ref, struct n=
vmet_fc_hostport, ref);
58ab8ff9dca214 James Smart   2020-03-31   989  	struct nvmet_fc_tgtport *tg=
tport =3D hostport->tgtport;
58ab8ff9dca214 James Smart   2020-03-31   990  	unsigned long flags;
58ab8ff9dca214 James Smart   2020-03-31   991  =

58ab8ff9dca214 James Smart   2020-03-31   992  	spin_lock_irqsave(&tgtport-=
>lock, flags);
58ab8ff9dca214 James Smart   2020-03-31   993  	list_del(&hostport->host_li=
st);
58ab8ff9dca214 James Smart   2020-03-31   994  	spin_unlock_irqrestore(&tgt=
port->lock, flags);
58ab8ff9dca214 James Smart   2020-03-31   995  	if (tgtport->ops->host_rele=
ase && hostport->invalid)
58ab8ff9dca214 James Smart   2020-03-31   996  		tgtport->ops->host_release=
(hostport->hosthandle);
58ab8ff9dca214 James Smart   2020-03-31   997  	kfree(hostport);
58ab8ff9dca214 James Smart   2020-03-31   998  	nvmet_fc_tgtport_put(tgtpor=
t);
58ab8ff9dca214 James Smart   2020-03-31   999  }
58ab8ff9dca214 James Smart   2020-03-31  1000  =

58ab8ff9dca214 James Smart   2020-03-31  1001  static void
58ab8ff9dca214 James Smart   2020-03-31  1002  nvmet_fc_hostport_put(struct=
 nvmet_fc_hostport *hostport)
58ab8ff9dca214 James Smart   2020-03-31  1003  {
58ab8ff9dca214 James Smart   2020-03-31  1004  	kref_put(&hostport->ref, nv=
met_fc_hostport_free);
58ab8ff9dca214 James Smart   2020-03-31  1005  }
58ab8ff9dca214 James Smart   2020-03-31  1006  =

58ab8ff9dca214 James Smart   2020-03-31  1007  static int
58ab8ff9dca214 James Smart   2020-03-31  1008  nvmet_fc_hostport_get(struct=
 nvmet_fc_hostport *hostport)
58ab8ff9dca214 James Smart   2020-03-31  1009  {
58ab8ff9dca214 James Smart   2020-03-31  1010  	return kref_get_unless_zero=
(&hostport->ref);
58ab8ff9dca214 James Smart   2020-03-31  1011  }
58ab8ff9dca214 James Smart   2020-03-31  1012  =

58ab8ff9dca214 James Smart   2020-03-31  1013  static void
58ab8ff9dca214 James Smart   2020-03-31  1014  nvmet_fc_free_hostport(struc=
t nvmet_fc_hostport *hostport)
58ab8ff9dca214 James Smart   2020-03-31  1015  {
58ab8ff9dca214 James Smart   2020-03-31  1016  	/* if LLDD not implemented,=
 leave as NULL */
ddd3d1051797b9 James Smart   2020-09-22  1017  	if (!hostport || !hostport-=
>hosthandle)
58ab8ff9dca214 James Smart   2020-03-31  1018  		return;
58ab8ff9dca214 James Smart   2020-03-31  1019  =

58ab8ff9dca214 James Smart   2020-03-31  1020  	nvmet_fc_hostport_put(hostp=
ort);
58ab8ff9dca214 James Smart   2020-03-31  1021  }
58ab8ff9dca214 James Smart   2020-03-31  1022  =

0d8ddeea11d000 Amit Engel    2021-03-22  1023  static struct nvmet_fc_hostp=
ort *
0d8ddeea11d000 Amit Engel    2021-03-22 @1024  nvmet_fc_match_hostport(stru=
ct nvmet_fc_tgtport *tgtport, void *hosthandle)
0d8ddeea11d000 Amit Engel    2021-03-22  1025  {
0d8ddeea11d000 Amit Engel    2021-03-22  1026  	struct nvmet_fc_hostport *h=
ost;
0d8ddeea11d000 Amit Engel    2021-03-22  1027  =

0d8ddeea11d000 Amit Engel    2021-03-22  1028  	lockdep_assert_held(&tgtpor=
t->lock);
0d8ddeea11d000 Amit Engel    2021-03-22  1029  =

0d8ddeea11d000 Amit Engel    2021-03-22  1030  	list_for_each_entry(host, &=
tgtport->host_list, host_list) {
0d8ddeea11d000 Amit Engel    2021-03-22 @1031  		if (host->hosthandle =3D=
=3D hosthandle && !host->invalid) {
0d8ddeea11d000 Amit Engel    2021-03-22  1032  			if (nvmet_fc_hostport_get=
(host))
0d8ddeea11d000 Amit Engel    2021-03-22  1033  				return (host);
0d8ddeea11d000 Amit Engel    2021-03-22  1034  		}
0d8ddeea11d000 Amit Engel    2021-03-22  1035  	}
0d8ddeea11d000 Amit Engel    2021-03-22  1036  =

0d8ddeea11d000 Amit Engel    2021-03-22  1037  	return NULL;
0d8ddeea11d000 Amit Engel    2021-03-22  1038  }
0d8ddeea11d000 Amit Engel    2021-03-22  1039  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1950532240236463408==--


Content-Type: multipart/mixed; boundary="===============3543563398355015484=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [vhost:vhost 8/22] drivers/virtio/virtio_mem.c:1389:5: warning: Redundant initialization for 'rc'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Tue, 05 May 2020 19:09:27 +0800
Message-ID: <202005051923.Z8P1BYp1%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3543563398355015484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: kvm(a)vger.kernel.org
CC: virtualization(a)lists.linux-foundation.org
CC: netdev(a)vger.kernel.org
TO: David Hildenbrand <david@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
head:   da1742791d8c0c0a8e5471f181549c4726a5c5f9
commit: 7527631e900d464ed2d533f799cb0da2b29cc6f0 [8/22] virtio-mem: Paravir=
tualized memory hotplug
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/virtio/virtio_mem.c:1389:5: warning: Redundant initialization fo=
r 'rc'. The initialized value is overwritten before it is read. [redundantI=
nitialization]
    rc =3D virtio_mem_init_vq(vm);
       ^
   drivers/virtio/virtio_mem.c:1373:9: note: rc is initialized
    int rc =3D -EINVAL;
           ^
   drivers/virtio/virtio_mem.c:1389:5: note: rc is overwritten
    rc =3D virtio_mem_init_vq(vm);
       ^
>> drivers/virtio/virtio_mem.c:799:22: warning: int result is assigned to l=
ong variable. If the variable is long to avoid loss of information, then yo=
u have loss of information. [truncLongCastAssignment]
    const uint64_t size =3D count * vm->subblock_size;
                        ^
   drivers/virtio/virtio_mem.c:820:22: warning: int result is assigned to l=
ong variable. If the variable is long to avoid loss of information, then yo=
u have loss of information. [truncLongCastAssignment]
    const uint64_t size =3D count * vm->subblock_size;
                        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/commit/?id=
=3D7527631e900d464ed2d533f799cb0da2b29cc6f0
git remote add vhost https://git.kernel.org/pub/scm/linux/kernel/git/mst/vh=
ost.git
git remote update vhost
git checkout 7527631e900d464ed2d533f799cb0da2b29cc6f0
vim +/rc +1389 drivers/virtio/virtio_mem.c

7527631e900d46 David Hildenbrand 2020-03-11  1369  =

7527631e900d46 David Hildenbrand 2020-03-11  1370  static int virtio_mem_pr=
obe(struct virtio_device *vdev)
7527631e900d46 David Hildenbrand 2020-03-11  1371  {
7527631e900d46 David Hildenbrand 2020-03-11  1372  	struct virtio_mem *vm;
7527631e900d46 David Hildenbrand 2020-03-11  1373  	int rc =3D -EINVAL;
7527631e900d46 David Hildenbrand 2020-03-11  1374  =

7527631e900d46 David Hildenbrand 2020-03-11  1375  	vdev->priv =3D vm =3D k=
zalloc(sizeof(*vm), GFP_KERNEL);
7527631e900d46 David Hildenbrand 2020-03-11  1376  	if (!vm)
7527631e900d46 David Hildenbrand 2020-03-11  1377  		return -ENOMEM;
7527631e900d46 David Hildenbrand 2020-03-11  1378  =

7527631e900d46 David Hildenbrand 2020-03-11  1379  	init_waitqueue_head(&vm=
->host_resp);
7527631e900d46 David Hildenbrand 2020-03-11  1380  	vm->vdev =3D vdev;
7527631e900d46 David Hildenbrand 2020-03-11  1381  	INIT_WORK(&vm->wq, virt=
io_mem_run_wq);
7527631e900d46 David Hildenbrand 2020-03-11  1382  	mutex_init(&vm->hotplug=
_mutex);
7527631e900d46 David Hildenbrand 2020-03-11  1383  	INIT_LIST_HEAD(&vm->nex=
t);
7527631e900d46 David Hildenbrand 2020-03-11  1384  	spin_lock_init(&vm->rem=
oval_lock);
7527631e900d46 David Hildenbrand 2020-03-11  1385  	hrtimer_init(&vm->retry=
_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
7527631e900d46 David Hildenbrand 2020-03-11  1386  	vm->retry_timer.functio=
n =3D virtio_mem_timer_expired;
7527631e900d46 David Hildenbrand 2020-03-11  1387  =

7527631e900d46 David Hildenbrand 2020-03-11  1388  	/* register the virtque=
ue */
7527631e900d46 David Hildenbrand 2020-03-11 @1389  	rc =3D virtio_mem_init_=
vq(vm);
7527631e900d46 David Hildenbrand 2020-03-11  1390  	if (rc)
7527631e900d46 David Hildenbrand 2020-03-11  1391  		goto out_free_vm;
7527631e900d46 David Hildenbrand 2020-03-11  1392  =

7527631e900d46 David Hildenbrand 2020-03-11  1393  	/* initialize the devic=
e by querying the config */
7527631e900d46 David Hildenbrand 2020-03-11  1394  	rc =3D virtio_mem_init(=
vm);
7527631e900d46 David Hildenbrand 2020-03-11  1395  	if (rc)
7527631e900d46 David Hildenbrand 2020-03-11  1396  		goto out_del_vq;
7527631e900d46 David Hildenbrand 2020-03-11  1397  =

7527631e900d46 David Hildenbrand 2020-03-11  1398  	/* register callbacks */
7527631e900d46 David Hildenbrand 2020-03-11  1399  	vm->memory_notifier.not=
ifier_call =3D virtio_mem_memory_notifier_cb;
7527631e900d46 David Hildenbrand 2020-03-11  1400  	rc =3D register_memory_=
notifier(&vm->memory_notifier);
7527631e900d46 David Hildenbrand 2020-03-11  1401  	if (rc)
7527631e900d46 David Hildenbrand 2020-03-11  1402  		goto out_del_vq;
7527631e900d46 David Hildenbrand 2020-03-11  1403  	rc =3D register_virtio_=
mem_device(vm);
7527631e900d46 David Hildenbrand 2020-03-11  1404  	if (rc)
7527631e900d46 David Hildenbrand 2020-03-11  1405  		goto out_unreg_mem;
7527631e900d46 David Hildenbrand 2020-03-11  1406  =

7527631e900d46 David Hildenbrand 2020-03-11  1407  	virtio_device_ready(vde=
v);
7527631e900d46 David Hildenbrand 2020-03-11  1408  =

7527631e900d46 David Hildenbrand 2020-03-11  1409  	/* trigger a config upd=
ate to start processing the requested_size */
7527631e900d46 David Hildenbrand 2020-03-11  1410  	atomic_set(&vm->config_=
changed, 1);
7527631e900d46 David Hildenbrand 2020-03-11  1411  	queue_work(system_freez=
able_wq, &vm->wq);
7527631e900d46 David Hildenbrand 2020-03-11  1412  =

7527631e900d46 David Hildenbrand 2020-03-11  1413  	return 0;
7527631e900d46 David Hildenbrand 2020-03-11  1414  out_unreg_mem:
7527631e900d46 David Hildenbrand 2020-03-11  1415  	unregister_memory_notif=
ier(&vm->memory_notifier);
7527631e900d46 David Hildenbrand 2020-03-11  1416  out_del_vq:
7527631e900d46 David Hildenbrand 2020-03-11  1417  	vdev->config->del_vqs(v=
dev);
7527631e900d46 David Hildenbrand 2020-03-11  1418  out_free_vm:
7527631e900d46 David Hildenbrand 2020-03-11  1419  	kfree(vm);
7527631e900d46 David Hildenbrand 2020-03-11  1420  	vdev->priv =3D NULL;
7527631e900d46 David Hildenbrand 2020-03-11  1421  =

7527631e900d46 David Hildenbrand 2020-03-11  1422  	return rc;
7527631e900d46 David Hildenbrand 2020-03-11  1423  }
7527631e900d46 David Hildenbrand 2020-03-11  1424  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3543563398355015484==--


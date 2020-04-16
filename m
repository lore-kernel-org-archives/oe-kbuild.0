Content-Type: multipart/mixed; boundary="===============0125469587146754832=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/9] drm/i915: Update client name on context create
Date: Thu, 16 Apr 2020 14:12:52 +0800
Message-ID: <202004161432.klfRM0ss%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0125469587146754832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200415101138.26126-3-tvrtko.ursulin@linux.intel.com>
References: <20200415101138.26126-3-tvrtko.ursulin@linux.intel.com>
TO: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
TO: Intel-gfx(a)lists.freedesktop.org
CC: Chris Wilson <chris@chris-wilson.co.uk>

Hi Tvrtko,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on v5.7-rc1 next-20200415]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Tvrtko-Ursulin/Per-client-=
engine-busyness/20200416-032109
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
reproduce:
        # apt-get install sparse
        # sparse version: =

        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/gpu/drm/i915/i915_drm_client.c:130:23: sparse: warning: incorrec=
t type in argument 1 (different address spaces)
>> drivers/gpu/drm/i915/i915_drm_client.c:130:23: sparse:    expected struc=
t pid *pid
>> drivers/gpu/drm/i915/i915_drm_client.c:130:23: sparse:    got struct pid=
 [noderef] <asn:4> *pid
   drivers/gpu/drm/i915/i915_drm_client.c:131:21: sparse: warning: incorrec=
t type in argument 1 (different address spaces)
>> drivers/gpu/drm/i915/i915_drm_client.c:131:21: sparse:    expected void =
const *
>> drivers/gpu/drm/i915/i915_drm_client.c:131:21: sparse:    got char [node=
ref] <asn:4> *name
   drivers/gpu/drm/i915/i915_drm_client.c:232:17: sparse: error: incompatib=
le types in comparison expression (different address spaces):
>> drivers/gpu/drm/i915/i915_drm_client.c:232:17: sparse:    struct pid *
>> drivers/gpu/drm/i915/i915_drm_client.c:232:17: sparse:    struct pid [no=
deref] <asn:4> *

# https://github.com/0day-ci/linux/commit/68e51ee0010d0e158add87c4362668f00=
9fc8130
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 68e51ee0010d0e158add87c4362668f009fc8130
vim +130 drivers/gpu/drm/i915/i915_drm_client.c

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  104  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  105  static int
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  106  __i915_drm_client_register(s=
truct i915_drm_client *client,
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  107  			   struct task_struct *ta=
sk)
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  108  {
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  109  	struct i915_drm_clients *cl=
ients =3D client->clients;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  110  	char *name;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  111  	int ret;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  112  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  113  	name =3D kstrdup(task->comm=
, GFP_KERNEL);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  114  	if (!name)
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  115  		return -ENOMEM;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  116  =

68e51ee0010d0e Tvrtko Ursulin 2020-04-15  117  	rcu_assign_pointer(client->=
pid, get_task_pid(task, PIDTYPE_PID));
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  118  	rcu_assign_pointer(client->=
name, name);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  119  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  120  	if (!clients->root)
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  121  		return 0; /* intel_fbdev_i=
nit registers a client before sysfs */
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  122  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  123  	ret =3D __client_register_s=
ysfs(client);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  124  	if (ret)
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  125  		goto err_sysfs;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  126  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  127  	return 0;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  128  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  129  err_sysfs:
d76ac5524c4129 Tvrtko Ursulin 2020-04-15 @130  	put_pid(client->pid);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15 @131  	kfree(client->name);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  132  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  133  	return ret;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  134  }
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  135  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  136  static void
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  137  __i915_drm_client_unregister=
(struct i915_drm_client *client)
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  138  {
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  139  	__client_unregister_sysfs(c=
lient);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  140  =

68e51ee0010d0e Tvrtko Ursulin 2020-04-15  141  	put_pid(rcu_replace_pointer=
(client->pid, NULL, true));
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  142  	kfree(rcu_replace_pointer(c=
lient->name, NULL, true));
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  143  }
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  144  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  145  struct i915_drm_client *
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  146  i915_drm_client_add(struct i=
915_drm_clients *clients, struct task_struct *task)
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  147  {
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  148  	struct i915_drm_client *cli=
ent;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  149  	int ret;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  150  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  151  	client =3D kzalloc(sizeof(*=
client), GFP_KERNEL);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  152  	if (!client)
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  153  		return ERR_PTR(-ENOMEM);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  154  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  155  	kref_init(&client->kref);
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  156  	mutex_init(&client->update_=
lock);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  157  	client->clients =3D clients;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  158  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  159  	ret =3D xa_alloc_cyclic(&cl=
ients->xarray, &client->id, client,
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  160  			      xa_limit_32b, &clie=
nts->next_id, GFP_KERNEL);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  161  	if (ret)
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  162  		goto err_id;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  163  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  164  	ret =3D __i915_drm_client_r=
egister(client, task);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  165  	if (ret)
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  166  		goto err_register;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  167  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  168  	return client;
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  169  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  170  err_register:
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  171  	xa_erase(&clients->xarray, =
client->id);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  172  err_id:
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  173  	kfree(client);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  174  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  175  	return ERR_PTR(ret);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  176  }
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  177  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  178  void __i915_drm_client_free(=
struct kref *kref)
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  179  {
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  180  	struct i915_drm_client *cli=
ent =3D
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  181  		container_of(kref, typeof(=
*client), kref);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  182  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  183  	__i915_drm_client_unregiste=
r(client);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  184  	xa_erase(&client->clients->=
xarray, client->id);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  185  	kfree_rcu(client, rcu);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  186  }
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  187  =

d76ac5524c4129 Tvrtko Ursulin 2020-04-15  188  void i915_drm_client_close(s=
truct i915_drm_client *client)
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  189  {
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  190  	GEM_BUG_ON(READ_ONCE(client=
->closed));
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  191  	WRITE_ONCE(client->closed, =
true);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  192  	i915_drm_client_put(client);
d76ac5524c4129 Tvrtko Ursulin 2020-04-15  193  }
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  194  =

68e51ee0010d0e Tvrtko Ursulin 2020-04-15  195  struct client_update_free {
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  196  	struct rcu_head rcu;
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  197  	struct pid *pid;
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  198  	char *name;
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  199  };
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  200  =

68e51ee0010d0e Tvrtko Ursulin 2020-04-15  201  static void __client_update_=
free(struct rcu_head *rcu)
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  202  {
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  203  	struct client_update_free *=
old =3D container_of(rcu, typeof(*old), rcu);
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  204  =

68e51ee0010d0e Tvrtko Ursulin 2020-04-15  205  	put_pid(old->pid);
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  206  	kfree(old->name);
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  207  	kfree(old);
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  208  }
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  209  =

68e51ee0010d0e Tvrtko Ursulin 2020-04-15  210  int
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  211  i915_drm_client_update(struc=
t i915_drm_client *client,
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  212  		       struct task_struct =
*task)
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  213  {
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  214  	struct drm_i915_private *i9=
15 =3D
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  215  		container_of(client->clien=
ts, typeof(*i915), clients);
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  216  	struct client_update_free *=
old;
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  217  	struct pid *pid;
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  218  	char *name;
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  219  	int ret;
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  220  =

68e51ee0010d0e Tvrtko Ursulin 2020-04-15  221  	old =3D kmalloc(sizeof(*old=
), GFP_KERNEL);
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  222  	if (!old)
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  223  		return -ENOMEM;
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  224  =

68e51ee0010d0e Tvrtko Ursulin 2020-04-15  225  	ret =3D mutex_lock_interrup=
tible(&client->update_lock);
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  226  	if (ret)
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  227  		goto out_free;
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  228  =

68e51ee0010d0e Tvrtko Ursulin 2020-04-15  229  	pid =3D get_task_pid(task, =
PIDTYPE_PID);
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  230  	if (!pid)
68e51ee0010d0e Tvrtko Ursulin 2020-04-15  231  		goto out_pid;
68e51ee0010d0e Tvrtko Ursulin 2020-04-15 @232  	if (pid =3D=3D client->pid)

:::::: The code at line 130 was first introduced by commit
:::::: d76ac5524c4129b1718d52109a90ec752b1ba2fe drm/i915: Expose list of cl=
ients in sysfs

:::::: TO: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
:::::: CC: 0day robot <lkp@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0125469587146754832==--


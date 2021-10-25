Content-Type: multipart/mixed; boundary="===============4286001529234153233=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/intel_execlists_submission.c:5910:3: warning: %d in format string (no. 2) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Tue, 26 Oct 2021 04:06:54 +0800
Message-ID: <202110260430.sJN7KX7u-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4286001529234153233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Wilson <chris@chris-wilson.co.uk>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   87066fdd2e30fe9dd531125d95257c118a74617e
commit: 70a2b431c36483c0c06e589e11c59e438cd0ac06 drm/i915/gt: Rename lrc.c =
to execlists_submission.c
date:   11 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 11 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gt/intel_execlists_submission.c:5910:3: warning: %d=
 in format string (no. 2) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
     snprintf(ve->base.name, sizeof(ve->base.name),
     ^

vim +5910 drivers/gpu/drm/i915/gt/intel_execlists_submission.c

ee1136908e9b28 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5791  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5792  struct intel_context *
e6ba76480299a0 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-12-2=
1  5793  intel_execlists_create_virtual(struct intel_engine_cs **siblings,
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5794  			       unsigned int count)
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5795  {
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5796  	struct virtual_engine *ve;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5797  	unsigned int n;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5798  	int err;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5799  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5800  	if (count =3D=3D 0)
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5801  		return ERR_PTR(-EINVAL);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5802  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5803  	if (count =3D=3D 1)
e6ba76480299a0 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-12-2=
1  5804  		return intel_context_create(siblings[0]);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5805  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5806  	ve =3D kzalloc(struct_size(ve, siblings, count), GFP_KERNEL);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5807  	if (!ve)
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5808  		return ERR_PTR(-ENOMEM);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5809  =

e6ba76480299a0 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-12-2=
1  5810  	ve->base.i915 =3D siblings[0]->i915;
f937f5613b6f10 drivers/gpu/drm/i915/gt/intel_lrc.c Tvrtko Ursulin 2019-06-2=
1  5811  	ve->base.gt =3D siblings[0]->gt;
20af04f3dd5679 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-10-0=
8  5812  	ve->base.uncore =3D siblings[0]->uncore;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5813  	ve->base.id =3D -1;
f75fc37b5e70b7 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2020-01-0=
6  5814  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5815  	ve->base.class =3D OTHER_CLASS;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5816  	ve->base.uabi_class =3D I915_ENGINE_CLASS_INVALID;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5817  	ve->base.instance =3D I915_ENGINE_CLASS_INVALID_VIRTUAL;
f75fc37b5e70b7 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2020-01-0=
6  5818  	ve->base.uabi_instance =3D I915_ENGINE_CLASS_INVALID_VIRTUAL;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5819  =

44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5820  	/*
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5821  	 * The decision on whether to submit a request using semaphores
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5822  	 * depends on the saturated state of the engine. We only compute
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5823  	 * this during HW submission of the request, and we need for this
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5824  	 * state to be globally applied to all requests being submitted
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5825  	 * to this engine. Virtual engines encompass more than one physic=
al
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5826  	 * engine and so we cannot accurately tell in advance if one of t=
hose
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5827  	 * engines is already saturated and so cannot afford to use a sem=
aphore
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5828  	 * and be pessimized in priority for doing so -- if we are the on=
ly
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5829  	 * context using semaphores after all other clients have stopped,=
 we
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5830  	 * will be starved on the saturated system. Such a global switch =
for
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5831  	 * semaphores is less than ideal, but alas is the current comprom=
ise.
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5832  	 */
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5833  	ve->base.saturated =3D ALL_ENGINES;
44d89409a12eb8 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
8  5834  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5835  	snprintf(ve->base.name, sizeof(ve->base.name), "virtual");
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5836  =

422d7df4f090bb drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
4  5837  	intel_engine_init_active(&ve->base, ENGINE_VIRTUAL);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5838  	intel_engine_init_execlists(&ve->base);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5839  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5840  	ve->base.cops =3D &virtual_context_ops;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5841  	ve->base.request_alloc =3D execlists_request_alloc;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5842  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5843  	ve->base.schedule =3D i915_schedule;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5844  	ve->base.submit_request =3D virtual_submit_request;
ee1136908e9b28 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5845  	ve->base.bond_execute =3D virtual_bond_execute;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5846  =

422d7df4f090bb drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-06-1=
4  5847  	INIT_LIST_HEAD(virtual_queue(ve));
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5848  	ve->base.execlists.queue_priority_hint =3D INT_MIN;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5849  	tasklet_init(&ve->base.execlists.tasklet,
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5850  		     virtual_submission_tasklet,
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5851  		     (unsigned long)ve);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5852  =

e6ba76480299a0 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-12-2=
1  5853  	intel_context_init(&ve->context, &ve->base);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5854  =

b3786b29379c0e drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2020-07-3=
1  5855  	ve->base.breadcrumbs =3D intel_breadcrumbs_create(NULL);
b3786b29379c0e drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2020-07-3=
1  5856  	if (!ve->base.breadcrumbs) {
b3786b29379c0e drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2020-07-3=
1  5857  		err =3D -ENOMEM;
b3786b29379c0e drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2020-07-3=
1  5858  		goto err_put;
b3786b29379c0e drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2020-07-3=
1  5859  	}
b3786b29379c0e drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2020-07-3=
1  5860  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5861  	for (n =3D 0; n < count; n++) {
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5862  		struct intel_engine_cs *sibling =3D siblings[n];
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5863  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5864  		GEM_BUG_ON(!is_power_of_2(sibling->mask));
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5865  		if (sibling->mask & ve->base.mask) {
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5866  			DRM_DEBUG("duplicate %s entry in load balancer\n",
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5867  				  sibling->name);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5868  			err =3D -EINVAL;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5869  			goto err_put;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5870  		}
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5871  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5872  		/*
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5873  		 * The virtual engine implementation is tightly coupled to
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5874  		 * the execlists backend -- we push out request directly
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5875  		 * into a tree inside each physical engine. We could support
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5876  		 * layering if we handle cloning of the requests and
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5877  		 * submitting a copy into each backend.
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5878  		 */
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5879  		if (sibling->execlists.tasklet.func !=3D
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5880  		    execlists_submission_tasklet) {
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5881  			err =3D -ENODEV;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5882  			goto err_put;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5883  		}
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5884  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5885  		GEM_BUG_ON(RB_EMPTY_NODE(&ve->nodes[sibling->id].rb));
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5886  		RB_CLEAR_NODE(&ve->nodes[sibling->id].rb);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5887  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5888  		ve->siblings[ve->num_siblings++] =3D sibling;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5889  		ve->base.mask |=3D sibling->mask;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5890  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5891  		/*
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5892  		 * All physical engines must be compatible for their emission
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5893  		 * functions (as we build the instructions during request
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5894  		 * construction and do not alter them before submission
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5895  		 * on the physical engine). We use the engine class as a guide
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5896  		 * here, although that could be refined.
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5897  		 */
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5898  		if (ve->base.class !=3D OTHER_CLASS) {
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5899  			if (ve->base.class !=3D sibling->class) {
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5900  				DRM_DEBUG("invalid mixing of engine class, sibling %d, already=
 %d\n",
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5901  					  sibling->class, ve->base.class);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5902  				err =3D -EINVAL;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5903  				goto err_put;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5904  			}
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5905  			continue;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5906  		}
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5907  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5908  		ve->base.class =3D sibling->class;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5909  		ve->base.uabi_class =3D sibling->uabi_class;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1 @5910  		snprintf(ve->base.name, sizeof(ve->base.name),
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5911  			 "v%dx%d", ve->base.class, count);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5912  		ve->base.context_size =3D sibling->context_size;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5913  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5914  		ve->base.emit_bb_start =3D sibling->emit_bb_start;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5915  		ve->base.emit_flush =3D sibling->emit_flush;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5916  		ve->base.emit_init_breadcrumb =3D sibling->emit_init_breadcrumb;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5917  		ve->base.emit_fini_breadcrumb =3D sibling->emit_fini_breadcrumb;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5918  		ve->base.emit_fini_breadcrumb_dw =3D
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5919  			sibling->emit_fini_breadcrumb_dw;
09975b861aa0c5 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-07-0=
9  5920  =

09975b861aa0c5 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-07-0=
9  5921  		ve->base.flags =3D sibling->flags;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5922  	}
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5923  =

09975b861aa0c5 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-07-0=
9  5924  	ve->base.flags |=3D I915_ENGINE_IS_VIRTUAL;
09975b861aa0c5 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-07-0=
9  5925  =

110f9efa858f58 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2020-07-1=
3  5926  	virtual_engine_initial_hint(ve);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5927  	return &ve->context;
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5928  =

6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5929  err_put:
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5930  	intel_context_put(&ve->context);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5931  	return ERR_PTR(err);
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5932  }
6d06779e867243 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson   2019-05-2=
1  5933  =


:::::: The code at line 5910 was first introduced by commit
:::::: 6d06779e86724322d79eb53b26989edd9db188f6 drm/i915: Load balancing ac=
ross a virtual engine

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4286001529234153233==--


Content-Type: multipart/mixed; boundary="===============6450674960300970667=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs in Energy Model
Date: Mon, 08 Jun 2020 15:51:27 +0300
Message-ID: <20200608125127.GN22511@kadam>
In-Reply-To: <b347fb60-46d3-e59c-59fa-a2b10932fc49@arm.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6450674960300970667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2020 at 01:34:37PM +0100, Lukasz Luba wrote:
> Hi Dan,
> =

> Thank you for your analyzes.
> =

> On 6/8/20 12:51 PM, Dan Carpenter wrote:
> > Hi Lukasz,
> > =

> > I love your patch! Perhaps something to improve:
> > =

> > url:    https://github.com/0day-ci/linux/commits/Lukasz-Luba/Add-suppor=
t-for-devices-in-the-Energy-Model/20200527-180614
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm=
.git linux-next
> > =

> > config: i386-randconfig-m021-20200605 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > kernel/power/energy_model.c:316 em_dev_register_perf_domain() error: we=
 previously assumed 'dev->em_pd' could be null (see line 277)
> > =

> > # https://github.com/0day-ci/linux/commit/110d050cb7ba1c96e63ada498979d=
1fd99529be2
> > git remote add linux-review https://github.com/0day-ci/linux
> > git remote update linux-review
> > git checkout 110d050cb7ba1c96e63ada498979d1fd99529be2
> > vim +316 kernel/power/energy_model.c
> > =

> > 0e294e607adaf3 Lukasz Luba     2020-05-27  262  int em_dev_register_per=
f_domain(struct device *dev, unsigned int nr_states,
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  263  				struct em_data_call=
back *cb, cpumask_t *cpus)
> > 27871f7a8a341e Quentin Perret  2018-12-03  264  {
> > 27871f7a8a341e Quentin Perret  2018-12-03  265  	unsigned long cap, pre=
v_cap =3D 0;
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  266  	int cpu, ret;
> > 27871f7a8a341e Quentin Perret  2018-12-03  267
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  268  	if (!dev || !nr_states=
 || !cb)
> > 27871f7a8a341e Quentin Perret  2018-12-03  269  		return -EINVAL;
> > 27871f7a8a341e Quentin Perret  2018-12-03  270
> > 27871f7a8a341e Quentin Perret  2018-12-03  271  	/*
> > 27871f7a8a341e Quentin Perret  2018-12-03  272  	 * Use a mutex to seri=
alize the registration of performance domains and
> > 27871f7a8a341e Quentin Perret  2018-12-03  273  	 * let the driver-defi=
ned callback functions sleep.
> > 27871f7a8a341e Quentin Perret  2018-12-03  274  	 */
> > 27871f7a8a341e Quentin Perret  2018-12-03  275  	mutex_lock(&em_pd_mute=
x);
> > 27871f7a8a341e Quentin Perret  2018-12-03  276
> > 110d050cb7ba1c Lukasz Luba     2020-05-27 @277  	if (dev->em_pd) {
> >                                                              ^^^^^^^^^^
> > Check for NULL.
> > =

> > 27871f7a8a341e Quentin Perret  2018-12-03  278  		ret =3D -EEXIST;
> > 27871f7a8a341e Quentin Perret  2018-12-03  279  		goto unlock;
> > 27871f7a8a341e Quentin Perret  2018-12-03  280  	}
> > 27871f7a8a341e Quentin Perret  2018-12-03  281
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  282  	if (_is_cpu_device(dev=
)) {
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  283  		if (!cpus) {
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  284  			dev_err(dev, "EM: in=
valid CPU mask\n");
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  285  			ret =3D -EINVAL;
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  286  			goto unlock;
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  287  		}
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  288
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  289  		for_each_cpu(cpu, cpu=
s) {
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  290  			if (em_cpu_get(cpu))=
 {
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  291  				dev_err(dev, "EM: e=
xists for CPU%d\n", cpu);
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  292  				ret =3D -EEXIST;
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  293  				goto unlock;
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  294  			}
> > 27871f7a8a341e Quentin Perret  2018-12-03  295  			/*
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  296  			 * All CPUs of a dom=
ain must have the same
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  297  			 * micro-architectur=
e since they all share the same
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  298  			 * table.
> > 27871f7a8a341e Quentin Perret  2018-12-03  299  			 */
> > 8ec59c0f5f4966 Vincent Guittot 2019-06-17  300  			cap =3D arch_scale_c=
pu_capacity(cpu);
> > 27871f7a8a341e Quentin Perret  2018-12-03  301  			if (prev_cap && prev=
_cap !=3D cap) {
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  302  				dev_err(dev, "EM: C=
PUs of %*pbl must have the same capacity\n",
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  303  					cpumask_pr_args(cp=
us));
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  304
> > 27871f7a8a341e Quentin Perret  2018-12-03  305  				ret =3D -EINVAL;
> > 27871f7a8a341e Quentin Perret  2018-12-03  306  				goto unlock;
> > 27871f7a8a341e Quentin Perret  2018-12-03  307  			}
> > 27871f7a8a341e Quentin Perret  2018-12-03  308  			prev_cap =3D cap;
> > 27871f7a8a341e Quentin Perret  2018-12-03  309  		}
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  310  	}
> > 27871f7a8a341e Quentin Perret  2018-12-03  311
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  312  	ret =3D em_create_pd(d=
ev, nr_states, cb, cpus);
> > =

> > =

> > If it's a _is_cpu_device() then it iterates through a bunch of devices
> > and sets up cpu_dev->em_pd for each.  Presumably one of the devices is
> > "dev" or this would crash pretty early on in testing?
> =

> Yes, all of the devices taken from 'cpus' mask will get the em_pd set
> including the suspected @dev.
> To calm down this static analyzer I can remove the 'else'
> in line 204 to make 'dev->em_pd =3D pd' set always.
> 199         if (_is_cpu_device(dev))
> 200                 for_each_cpu(cpu, cpus) {
> 201                         cpu_dev =3D get_cpu_device(cpu);
> 202                         cpu_dev->em_pd =3D pd;
> 203                 }
> 204         else
> 205                 dev->em_pd =3D pd;
> =

> =

> Do you think it's a good solution and will work for this tool?

It's not about the tool...  Ignore the tool when it's wrong.  But I do
think the code is slightly more clear without the else statement.

Arguments could be made either way.  Removing the else statement means
we set dev->em_pd twice...  But I *personally* lean vaguely towards
removing the else statement.  :P

That would make the warning go away as well.

regards,
dan carpenter

--===============6450674960300970667==--


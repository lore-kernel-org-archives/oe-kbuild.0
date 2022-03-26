Content-Type: multipart/mixed; boundary="===============3514966572767536074=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [plbossart-sound:fix/cleanup-widgets 4/9] sound/soc/sof/ipc4-topology.c:712:8: warning: Uninitialized variable: ipc4_copier [uninitvar]
Date: Sat, 26 Mar 2022 23:49:56 +0800
Message-ID: <202203262325.lKfEAJ5C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3514966572767536074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: Rander Wang <rander.wang@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://github.com/thesofproject/linux fix/cleanup-widgets
head:   d0b44636cbe54543f369c997e9035106ae008040
commit: 3369b10d8f2580348b7a4f2ae321f9a26d6cd189 [4/9] ASoC: SOF: ipc4-topo=
logy: Add prepare op for AIF type widgets
:::::: branch date: 20 hours ago
:::::: commit date: 8 days ago
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/sof/ipc4-topology.c:712:8: warning: Uninitialized variable: ip=
c4_copier [uninitvar]
    kfree(ipc4_copier->ipc_config_data);
          ^
   sound/soc/sof/ipc4-topology.c:713:2: warning: Uninitialized variable: ip=
c4_copier [uninitvar]
    ipc4_copier->ipc_config_data =3D NULL;
    ^
   sound/soc/sof/ipc4-topology.c:714:2: warning: Uninitialized variable: ip=
c4_copier [uninitvar]
    ipc4_copier->ipc_config_size =3D 0;
    ^

vim +712 sound/soc/sof/ipc4-topology.c

3369b10d8f2580 Ranjani Sridharan 2022-03-11  696  =

3369b10d8f2580 Ranjani Sridharan 2022-03-11  697  static void sof_ipc4_unpr=
epare_copier_module(struct snd_sof_widget *swidget)
3369b10d8f2580 Ranjani Sridharan 2022-03-11  698  {
3369b10d8f2580 Ranjani Sridharan 2022-03-11  699  	struct sof_ipc4_fw_modul=
e *fw_module =3D swidget->module_info;
3369b10d8f2580 Ranjani Sridharan 2022-03-11  700  	struct sof_ipc4_copier *=
ipc4_copier;
3369b10d8f2580 Ranjani Sridharan 2022-03-11  701  	struct snd_sof_widget *p=
ipe_widget;
3369b10d8f2580 Ranjani Sridharan 2022-03-11  702  	struct sof_ipc4_pipeline=
 *pipeline;
3369b10d8f2580 Ranjani Sridharan 2022-03-11  703  =

3369b10d8f2580 Ranjani Sridharan 2022-03-11  704  	/* reset pipeline memory=
 usage */
3369b10d8f2580 Ranjani Sridharan 2022-03-11  705  	pipe_widget =3D swidget-=
>pipe_widget;
3369b10d8f2580 Ranjani Sridharan 2022-03-11  706  	pipeline =3D pipe_widget=
->private;
3369b10d8f2580 Ranjani Sridharan 2022-03-11  707  	pipeline->mem_usage =3D =
0;
3369b10d8f2580 Ranjani Sridharan 2022-03-11  708  =

3369b10d8f2580 Ranjani Sridharan 2022-03-11  709  	if (WIDGET_IS_AIF(swidge=
t->id))
3369b10d8f2580 Ranjani Sridharan 2022-03-11  710  		ipc4_copier =3D swidget=
->private;
3369b10d8f2580 Ranjani Sridharan 2022-03-11  711  =

3369b10d8f2580 Ranjani Sridharan 2022-03-11 @712  	kfree(ipc4_copier->ipc_c=
onfig_data);
3369b10d8f2580 Ranjani Sridharan 2022-03-11  713  	ipc4_copier->ipc_config_=
data =3D NULL;
3369b10d8f2580 Ranjani Sridharan 2022-03-11  714  	ipc4_copier->ipc_config_=
size =3D 0;
3369b10d8f2580 Ranjani Sridharan 2022-03-11  715  =

3369b10d8f2580 Ranjani Sridharan 2022-03-11  716  	ida_free(&fw_module->m_i=
da, swidget->instance_id);
3369b10d8f2580 Ranjani Sridharan 2022-03-11  717  }
3369b10d8f2580 Ranjani Sridharan 2022-03-11  718  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3514966572767536074==--


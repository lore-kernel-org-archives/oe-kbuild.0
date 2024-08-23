Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8995918028
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Aug 2024 12:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417190; cv=none; b=VJ9El18Durp2UzbwTvtr49n0Bk73nbsOpAGpqgV7mQLfP9VPezLGjgtMoXiWTLhGBvk5zX4QSGWwy0Ii7WD+/eiEtirKksvBXfbYtO5uV/zthvfURjNIoqt+i55M7N5YeQ38OnhlZqQeZzjLpW2fdNHjiWZ58QrJ1TAZ8nraOH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417190; c=relaxed/simple;
	bh=r+2OeUSAB3mysChR/47cObg2ahesJw/knt3QJlbXXpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZpIOhp9SncPTnWmOyUbPrVuFkBAvbCW8uHrzYq0Ee3F/sr2TWTBlN/uyPdaag69zeZXrEvbT1etLOhWOj6qRD8klBVqAQ3lsU1TO+o3VkFk9uL+Pl3fAx0UGjdiLeT2eOAa6Sxb2AYhzHBnDRzf87lAY8eBGkAxskzanb3Qsj1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7GzHUeg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7GzHUeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724417189; x=1755953189;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r+2OeUSAB3mysChR/47cObg2ahesJw/knt3QJlbXXpo=;
  b=U7GzHUegmo4OilGJjSQjSQz/5P/6zfVfUs1qfi0EObQNeEbaT/x8uqmo
   4lqQPwPYXOHD73MA2S4auzCb9KanDG0j84JxqkuCngEMJ2HB8hF5dcXIo
   9Hia78hpNlZkmrSLAyqn9+RBniIsYhft5Ue2nTKt5wjbAjuaCOZm55Mam
   4GMIJQx1yPLPwsBDGOr9pUzNXvfsVa8Dqav8KbrJ5jBJLEnfKYYMtyylw
   8iDNNEXCrrHYFfL1I8Hkqd7lqxNfzmA7jXNA/xENlg4JCvFpFe/XIircy
   g7JS1yotOKdW61BP11rLr/h8TvLtwypEN2Wgjbh705BbNkxlknu1HeI2t
   w==;
X-CSE-ConnectionGUID: 1K6hJqGGRj+Mr6mo4SmWEQ==
X-CSE-MsgGUID: /N2H0oCgQLGhCU+4EP5MGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23053109"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23053109"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 05:46:28 -0700
X-CSE-ConnectionGUID: XcRD4WEfT5qNMW6tzkhKzw==
X-CSE-MsgGUID: XFzhblPMQJa7cZpdhD7gsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66609312"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Aug 2024 05:46:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shTgO-000DiA-12;
	Fri, 23 Aug 2024 12:46:24 +0000
Date: Fri, 23 Aug 2024 20:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/5] Add map pgoff to python dictionary based on
 MAPPING_TYPE
Message-ID: <202408232031.V0CLXEbm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a813c21ee60cd03df02b33bfa92515b659863bf7.1724104248.git.scclevenger@os.amperecomputing.com>
References: <a813c21ee60cd03df02b33bfa92515b659863bf7.1724104248.git.scclevenger@os.amperecomputing.com>
TO: Steve Clevenger <scclevenger@os.amperecomputing.com>
TO: james.clark@arm.com
TO: mike.leach@linaro.org
CC: suzuki.poulose@arm.com
CC: leo.yan@linaro.org
CC: ilkka@os.ampercomputing.com
CC: coresight@lists.linaro.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: "steve.c.clevenger.ampere" <scclevenger@os.amperecomputing.com>

Hi Steve,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/perf/core]
[also build test ERROR on perf-tools/perf-tools linus/master v6.11-rc4 next-20240823]
[cannot apply to perf-tools-next/perf-tools-next acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steve-Clevenger/Add-dso__is_pie-call-to-identify-ELF-PIE/20240821-061504
base:   tip/perf/core
patch link:    https://lore.kernel.org/r/a813c21ee60cd03df02b33bfa92515b659863bf7.1724104248.git.scclevenger%40os.amperecomputing.com
patch subject: [PATCH 4/5] Add map pgoff to python dictionary based on MAPPING_TYPE
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408232031.V0CLXEbm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408232031.V0CLXEbm-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:656: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc1.ge6bc3ac8585c
>> util/scripting-engines/trace-event-python.c:908:36: error: expected ';' after expression
     908 |                         "symbol", "symoff", "map_pgoff")
         |                                                         ^
         |                                                         ;
   1 error generated.
   make[8]: *** [tools/build/Makefile.build:106: tools/perf/util/scripting-engines/trace-event-python.o] Error 1
   make[8]: *** Waiting for unfinished jobs....
   make[7]: *** [tools/build/Makefile.build:158: scripting-engines] Error 2
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:762: tools/perf/perf-util-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:265: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2


vim +908 tools/perf/util/scripting-engines/trace-event-python.c

bee272af78525b Adrian Hunter            2021-05-25  855  
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  856  static PyObject *get_perf_sample_dict(struct perf_sample *sample,
32dcd021d00403 Jiri Olsa                2019-07-21  857  					 struct evsel *evsel,
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  858  					 struct addr_location *al,
3f8e009e01c4ed Adrian Hunter            2021-05-25  859  					 struct addr_location *addr_al,
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  860  					 PyObject *callchain)
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  861  {
48a1f565261d2a Jin Yao                  2018-06-01  862  	PyObject *dict, *dict_sample, *brstack, *brstacksym;
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  863  
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  864  	dict = PyDict_New();
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  865  	if (!dict)
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  866  		Py_FatalError("couldn't create Python dictionary");
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  867  
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  868  	dict_sample = PyDict_New();
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  869  	if (!dict_sample)
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  870  		Py_FatalError("couldn't create Python dictionary");
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  871  
8ab2e96d8ff188 Arnaldo Carvalho de Melo 2020-04-29  872  	pydict_set_item_string_decref(dict, "ev_name", _PyUnicode_FromString(evsel__name(evsel)));
1fc632cef4ea13 Jiri Olsa                2019-07-21  873  	pydict_set_item_string_decref(dict, "attr", _PyBytes_FromStringAndSize((const char *)&evsel->core.attr, sizeof(evsel->core.attr)));
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  874  
acfd65c89403f3 Ben Gainey               2024-01-23  875  	pydict_set_item_string_decref(dict_sample, "id",
acfd65c89403f3 Ben Gainey               2024-01-23  876  			PyLong_FromUnsignedLongLong(sample->id));
acfd65c89403f3 Ben Gainey               2024-01-23  877  	pydict_set_item_string_decref(dict_sample, "stream_id",
acfd65c89403f3 Ben Gainey               2024-01-23  878  			PyLong_FromUnsignedLongLong(sample->stream_id));
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  879  	pydict_set_item_string_decref(dict_sample, "pid",
66dfdff03d196e Jaroslav Škarvada        2018-01-19  880  			_PyLong_FromLong(sample->pid));
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  881  	pydict_set_item_string_decref(dict_sample, "tid",
66dfdff03d196e Jaroslav Škarvada        2018-01-19  882  			_PyLong_FromLong(sample->tid));
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  883  	pydict_set_item_string_decref(dict_sample, "cpu",
66dfdff03d196e Jaroslav Škarvada        2018-01-19  884  			_PyLong_FromLong(sample->cpu));
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  885  	pydict_set_item_string_decref(dict_sample, "ip",
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  886  			PyLong_FromUnsignedLongLong(sample->ip));
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  887  	pydict_set_item_string_decref(dict_sample, "time",
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  888  			PyLong_FromUnsignedLongLong(sample->time));
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  889  	pydict_set_item_string_decref(dict_sample, "period",
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  890  			PyLong_FromUnsignedLongLong(sample->period));
41013f0c095980 Kan Liang                2018-01-04  891  	pydict_set_item_string_decref(dict_sample, "phys_addr",
41013f0c095980 Kan Liang                2018-01-04  892  			PyLong_FromUnsignedLongLong(sample->phys_addr));
943f32a0e8a4ea Leo Yan                  2018-05-28  893  	pydict_set_item_string_decref(dict_sample, "addr",
943f32a0e8a4ea Leo Yan                  2018-05-28  894  			PyLong_FromUnsignedLongLong(sample->addr));
74ec14f3893c30 Arun Kalyanasundaram     2017-07-21  895  	set_sample_read_in_dict(dict_sample, sample, evsel);
48a1f565261d2a Jin Yao                  2018-06-01  896  	pydict_set_item_string_decref(dict_sample, "weight",
48a1f565261d2a Jin Yao                  2018-06-01  897  			PyLong_FromUnsignedLongLong(sample->weight));
48a1f565261d2a Jin Yao                  2018-06-01  898  	pydict_set_item_string_decref(dict_sample, "transaction",
48a1f565261d2a Jin Yao                  2018-06-01  899  			PyLong_FromUnsignedLongLong(sample->transaction));
48a1f565261d2a Jin Yao                  2018-06-01  900  	set_sample_datasrc_in_dict(dict_sample, sample);
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  901  	pydict_set_item_string_decref(dict, "sample", dict_sample);
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  902  
66dfdff03d196e Jaroslav Škarvada        2018-01-19  903  	pydict_set_item_string_decref(dict, "raw_buf", _PyBytes_FromStringAndSize(
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  904  			(const char *)sample->raw_data, sample->raw_size));
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  905  	pydict_set_item_string_decref(dict, "comm",
66dfdff03d196e Jaroslav Škarvada        2018-01-19  906  			_PyUnicode_FromString(thread__comm_str(al->thread)));
c4f462235c0f61 Leo Yan                  2022-05-21  907  	set_sym_in_dict(dict, al, "dso", "dso_bid", "dso_map_start", "dso_map_end",
e6bc3ac8585c9d steve.c.clevenger.ampere 2024-08-20 @908  			"symbol", "symoff", "map_pgoff")
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  909  
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  910  	pydict_set_item_string_decref(dict, "callchain", callchain);
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  911  
48a1f565261d2a Jin Yao                  2018-06-01  912  	brstack = python_process_brstack(sample, al->thread);
48a1f565261d2a Jin Yao                  2018-06-01  913  	pydict_set_item_string_decref(dict, "brstack", brstack);
48a1f565261d2a Jin Yao                  2018-06-01  914  
48a1f565261d2a Jin Yao                  2018-06-01  915  	brstacksym = python_process_brstacksym(sample, al->thread);
48a1f565261d2a Jin Yao                  2018-06-01  916  	pydict_set_item_string_decref(dict, "brstacksym", brstacksym);
48a1f565261d2a Jin Yao                  2018-06-01  917  
6de306b7a5304e Adrian Hunter            2022-07-11  918  	if (sample->machine_pid) {
6de306b7a5304e Adrian Hunter            2022-07-11  919  		pydict_set_item_string_decref(dict_sample, "machine_pid",
6de306b7a5304e Adrian Hunter            2022-07-11  920  				_PyLong_FromLong(sample->machine_pid));
6de306b7a5304e Adrian Hunter            2022-07-11  921  		pydict_set_item_string_decref(dict_sample, "vcpu",
6de306b7a5304e Adrian Hunter            2022-07-11  922  				_PyLong_FromLong(sample->vcpu));
6de306b7a5304e Adrian Hunter            2022-07-11  923  	}
6de306b7a5304e Adrian Hunter            2022-07-11  924  
22cc2f74bbe217 Adrian Hunter            2021-05-25  925  	pydict_set_item_string_decref(dict_sample, "cpumode",
22cc2f74bbe217 Adrian Hunter            2021-05-25  926  			_PyLong_FromLong((unsigned long)sample->cpumode));
22cc2f74bbe217 Adrian Hunter            2021-05-25  927  
3f8e009e01c4ed Adrian Hunter            2021-05-25  928  	if (addr_al) {
3f8e009e01c4ed Adrian Hunter            2021-05-25  929  		pydict_set_item_string_decref(dict_sample, "addr_correlates_sym",
3f8e009e01c4ed Adrian Hunter            2021-05-25  930  			PyBool_FromLong(1));
c4f462235c0f61 Leo Yan                  2022-05-21  931  		set_sym_in_dict(dict_sample, addr_al, "addr_dso", "addr_dso_bid",
c4f462235c0f61 Leo Yan                  2022-05-21  932  				"addr_dso_map_start", "addr_dso_map_end",
e6bc3ac8585c9d steve.c.clevenger.ampere 2024-08-20  933  				"addr_symbol", "addr_symoff", "map_pgoff");
3f8e009e01c4ed Adrian Hunter            2021-05-25  934  	}
3f8e009e01c4ed Adrian Hunter            2021-05-25  935  
bee272af78525b Adrian Hunter            2021-05-25  936  	if (sample->flags)
bee272af78525b Adrian Hunter            2021-05-25  937  		python_process_sample_flags(sample, dict_sample);
bee272af78525b Adrian Hunter            2021-05-25  938  
142b05182eaa44 Adrian Hunter            2021-05-25  939  	/* Instructions per cycle (IPC) */
142b05182eaa44 Adrian Hunter            2021-05-25  940  	if (sample->insn_cnt && sample->cyc_cnt) {
142b05182eaa44 Adrian Hunter            2021-05-25  941  		pydict_set_item_string_decref(dict_sample, "insn_cnt",
142b05182eaa44 Adrian Hunter            2021-05-25  942  			PyLong_FromUnsignedLongLong(sample->insn_cnt));
142b05182eaa44 Adrian Hunter            2021-05-25  943  		pydict_set_item_string_decref(dict_sample, "cyc_cnt",
142b05182eaa44 Adrian Hunter            2021-05-25  944  			PyLong_FromUnsignedLongLong(sample->cyc_cnt));
142b05182eaa44 Adrian Hunter            2021-05-25  945  	}
142b05182eaa44 Adrian Hunter            2021-05-25  946  
b457c526072aa8 Paran Lee                2023-11-21  947  	if (set_regs_in_dict(dict, sample, evsel))
b457c526072aa8 Paran Lee                2023-11-21  948  		Py_FatalError("Failed to setting regs in dict");
48a1f565261d2a Jin Yao                  2018-06-01  949  
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  950  	return dict;
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  951  }
892e76b2e8c5e8 Arun Kalyanasundaram     2017-07-21  952  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

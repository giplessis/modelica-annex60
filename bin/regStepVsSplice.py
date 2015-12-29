# -*- coding: utf-8 -*-
"""
This module contains tests for numerical efficiency of regStep() and splice()

Note
----

This script will only work if flag `Advanced.GenerateBlockTimers:=true;` is
set in Dymola.
"""

import os
import buildingspy.simulate.Simulator as si
import random
import matplotlib
import matplotlib.pyplot as plt
import numpy as np


def main():
    run_experiment()
#    simulate('PerformanceRegStep')
#    simulate('PerformanceSplice')
#    simulate('PerformanceRegStepInline')
#    simulate('PerformanceSpliceInline')


def run_experiment(runs=10):
    """Runs an experiment to test numerical efficiency of regStep vs. splice

    Parameters
    ----------

    runs : int
        Number of runs for each model
    """
    results = {'PerformanceRegStep': [],
               'PerformanceRegStepInline': [],
               'PerformanceSplice': [],
               'PerformanceSpliceInline': []}
    finished = False

    while finished is not True:
        choices = []
        for model in results.keys():
            if len(results[model]) < runs:
                choices.append(model)
        if len(choices) > 0:
            model = random.choice(choices)
            ex_time = simulate(model)
            results[model].append(ex_time)
        else:
            finished = True

    print results



    data = [results['PerformanceRegStep'],
            results['PerformanceRegStepInline'],
            results['PerformanceSplice'],
            results['PerformanceSpliceInline']]
    # multiple box plots on one figure
    fig, ax1 = plt.subplots(figsize=(10, 8))

    ax1.boxplot(data)
    ax1.set_title('Comparison of regStep vs. splice for ' +
                  str(runs) + ' runs each', fontsize=15)
    ax1.set_ylabel('Mean CPU time per call in us', fontsize=15)

    xtickNames = plt.setp(ax1, xticklabels=['RegStep',
                                            'RegStepInline',
                                            'Splice',
                                            'SpliceInline'])
    plt.setp(xtickNames, rotation=45, fontsize=15)
    plt.tight_layout()
    curr_dir = os.path.dirname(__file__)
    result_dir = os.path.join(curr_dir, 'results')
    plt.savefig(os.path.join(result_dir, 'regStepVsSplice.png'))
    plt.show()


def simulate(model):
    """Runs model and returns execution time of `Auxiliary2 code`

    Parameters
    ----------

    model : str
        {'PerformanceRegStep', 'PerformanceSplice',
        'PerformanceRegStepInline', 'PerformanceSpliceInline'}

    Returns
    -------

    ex_time : float
        Mean execution time in us
    """
    assert model in ['PerformanceRegStep',
                     'PerformanceSplice',
                     'PerformanceRegStepInline',
                     'PerformanceSpliceInline'], 'Unknown model'

    curr_dir = os.path.dirname(__file__)
    result_dir = os.path.join(curr_dir, 'results')
    if not os.path.exists(result_dir):
        os.mkdir(result_dir)
    output_dir = os.path.join(result_dir, model)

    model = 'Annex60.Experimental.Benchmarks.Utilities.Examples.' + model
    s = si.Simulator(model, 'dymola', output_dir)
    s.simulate()

    print 'simulated ' + model

    f = open(os.path.join(output_dir, 'dslog.txt'), 'r')
    for line in f.readlines():
        if 'Auxiliary2 code' in line:
            ex_time = float(line.split(',')[2].split('(')[0])
            break
    f.close()

    return ex_time

# Main function
if __name__ == '__main__':
    main()

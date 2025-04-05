def before_all(context):
    # initialize
    pass


def after_all(context):
    # cleanup
    pass


def before_feature(context, feature):
    # cleanup
    pass


def after_feature(context, feature):
    # cleanup
    pass


def before_scenario(context, scenario):
    pass


def after_scenario(context, scenario):
    # TODO delete the infrastructure created in 1_execute.py
    if "clear_infra_for_test" in scenario.tags:

        pass


def before_step(context, step):
    pass


def after_step(context, step):
    pass
